Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSaSC-0007Ap-EU
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 22:59:17 +0200
Received: by eaal1 with SMTP id l1so687408eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 13:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Jgc8/tXJLQ9MRO5t9eRbelScK5U78qd0cCpapDRY3gw=;
	b=0PLCxCERDlMotDKW8ZIi/1cBNi/hAerVQ9G0u6Aar9Swxxk+96MhX2Cq7P87uOR0c/
	SHRqc2bGc2NbqtRsal9DFIvU3MpLCxbIzm+IYWHMvk48PVdOXyvOyQwORXCN0fzUbBJz
	R71gL8ncL5D7ZTAjMmdkXgHMkSBrgCiNnvPnp3tQ+fE8tbPFaDvNayBcRltiIMw64/k8
	NTD3ZclUm3Kn2wn6MTyrI74eYPD/O90DqLEB8UlzRFKsOsjKzJMsJNCtInrqDaFxWtq4
	6C4Ivb6dPiXml+zjwB+tWTdzXOjlIEeaUwJp+eUpoPdKgHb5Ez6t6acvpKliKDE4PlNU
	hh1A==
Received: by 10.14.127.198 with SMTP id d46mr255723eei.101.1336682962033; Thu,
	10 May 2012 13:49:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 10 May 2012 13:48:51 -0700 (PDT)
In-Reply-To: <4FAC27A1.70902@windriver.com>
References: <1336680237-31671-1-git-send-email-obi@opendreambox.org>
	<CAMKF1spfSiBy0F-cP7Q2NYT2dg2CFqvfXxuxR_=-F2o8gdBwGw@mail.gmail.com>
	<4FAC27A1.70902@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2012 13:48:51 -0700
Message-ID: <CAMKF1sp3RJsrUC5befeKBn+sDQNw2wpUvO2Co+O9eSAhJ5BiLA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: fix packaging error for libext2fs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 20:59:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2012 at 1:40 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 5/10/12 3:30 PM, Khem Raj wrote:
>>
>> On Thu, May 10, 2012 at 1:03 PM, Andreas Oberritter
>> <obi@opendreambox.org> =C2=A0wrote:
>>>
>>>
>>> -FILES_libext2fs =3D "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.=
*"
>>> +FILES_libext2fs =3D "${libdir}/e2initrd_helper
>>> ${base_libdir}/libext2fs.so.*"
>>
>>
>> its probably not a good idea to mix files from libdir and base_libdir
>> in a single
>> package. Since lately we have been accommodating /usr to be mounted
>> independently.
>
>
> I am assuming the e2initrd_helper is an libexec component... =C2=A0Will

but its being installed into ${libdir}/e2initrd_helper I dont think
libdir will exist initially.

> libext2fs.so.* still work (during initial boot) w/o the libexec component=
?
> =C2=A0(I am assuming it will...)
>
> So this looks correct to me. =C2=A0The split packages can have mixed base=
 and
> prefixed components... it's the filesystem that we hope will work without
> the /usr being mounted. =C2=A0But if the library requires an item in /usr=
, then
> we may have to move that item to /lib as well....
>
> --Mark
>
>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


