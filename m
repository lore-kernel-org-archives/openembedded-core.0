Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3ToO-0007C9-Aq
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 16:18:08 +0200
Received: by bke11 with SMTP id 11so524367bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=+eMH0MfgUHLVqBXoEVsYdGa0pZ8sf/dRxuVrQYxVvNw=;
	b=poJa3DGJTXLthPV+EN/ZBPSve4wIiqic2DPRxGuWKZA/UYgvJHvkBknlmGFNGOP+7L
	iRdbKtRjDKMGVFkz6bqU1IZmfC6c6NXLP4Q35/Zhch1Q7TO0AOQZcxdkAAOaRPiXxOQd
	UQoQOpuETeYwHCj6K12TYLkVngE+JRU7WoD5Y=
MIME-Version: 1.0
Received: by 10.204.129.214 with SMTP id p22mr2243090bks.93.1315923178906;
	Tue, 13 Sep 2011 07:12:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Tue, 13 Sep 2011 07:12:58 -0700 (PDT)
In-Reply-To: <4E6EEDBE.70801@eukrea.com>
References: <1315646701-28916-1-git-send-email-eric@eukrea.com>
	<CAP9ODKoUZfRLHDv7p=wJAczZ_nh-7LeETabwzM8X_Hp_EyqN7g@mail.gmail.com>
	<4E6B3502.6020702@eukrea.com>
	<CAP9ODKoAZqdGAFJnyjdLKVCFUd5+wjndcWBPnH=DCrF7S19HRg@mail.gmail.com>
	<CAP9ODKr8_p-3KfSQjy8DBbeGPDS+JHts9enX-eksW_YOOcFFyw@mail.gmail.com>
	<4E6EEDBE.70801@eukrea.com>
Date: Tue, 13 Sep 2011 11:12:58 -0300
X-Google-Sender-Auth: A7nL8LtypoEgGlrGjJPpT-RYO6c
Message-ID: <CAP9ODKqCg-GOR-HLcuXzrgCVM2tt0anUCTeAEVoqGVFVG4YkEQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] qt4: fix generated sdk
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
X-List-Received-Date: Tue, 13 Sep 2011 14:18:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2011 at 02:44, Eric B=E9nard <eric@eukrea.com> wrote:
...
>> As we discussed on #oe I will be working at porting the O.S. Systems
>> qt.conf generation since this is required for CMake to properly work
>> with Qt applications.
>>
> one more detail : this patch is fine when not using cmake so can be
> integrated
> as is as it fix meta-toolchain-qte (the right path are set by both this
> patch and the environment-setup script on the toolchain.

Yes; indeed. This wasn't clear from my message, sorry for that.

> One more question : is there interest in a patch that move "qtopia" paths=
 to
> more standard "qt4" paths ?

I think it would be nice to have.

By the way, it seems you have a typo in the commit log; qmake is
written wrongly.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


