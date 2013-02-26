Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UAOtw-0002ek-Ci
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 19:05:17 +0100
Received: by mail-oa0-f45.google.com with SMTP id o6so5850616oag.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=lNJfch4tVdqC459y+pLF2pnvDtnU4LxxFClvnlxxZk4=;
	b=s4aOTToXe57xNQERV8Axsva15nYUjrdHstCscnX9ICLsof0S+ZxocM7zCm6e+4NQHW
	DaBy/hN+U2O/yp1O+MVaGGutzyVcSHJmeIrvKUdy33KlG5UMqiDt+DsqzfgPuLhPpxTj
	mRijHsrgQJTsOUU/rBxXU5JDo2BcfMn8gTfw7wYADuaHvdnwkIYF6bHGVLp/gU+vYgS/
	TqbXodnXGdxV9MMk1KZKnEBk2A+ZOknzp12gaE4mWWtTRzz9YO2fLLhVRlRpV8dnr14r
	0ucwSeMGSEa5fBku2P8ZMvXose3IO80mf4FXPNjMqmniJLEQ/OJ7OUs4Fa55CISRVPal
	EbWg==
MIME-Version: 1.0
X-Received: by 10.60.19.129 with SMTP id f1mr2230643oee.82.1361900936501; Tue,
	26 Feb 2013 09:48:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Tue, 26 Feb 2013 09:48:56 -0800 (PST)
In-Reply-To: <CAJTo0LY6GsxYVLd24W0ZHZ7=CN9T9zcJjA=JotJb5r+vUrmDBQ@mail.gmail.com>
References: <1361900109-21869-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKpR_ik-8F3d2-RwXDY=2Odn_uRVEwegZADSd38TCWmJ+w@mail.gmail.com>
	<CAJTo0LY6GsxYVLd24W0ZHZ7=CN9T9zcJjA=JotJb5r+vUrmDBQ@mail.gmail.com>
Date: Tue, 26 Feb 2013 14:48:56 -0300
X-Google-Sender-Auth: Zo4AC3wTD4QFOErNwo-JHy85kt0
Message-ID: <CAP9ODKoUwZ2r4CsUU8oME4=27DA9K79gWOv1VH18kKdj5hfDcg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: set the location of the kill binary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 18:05:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 2:42 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 26 February 2013 17:41, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> +export ac_cv_path_KILL="/bin/kill"
>>
>> This can be given in EXTRA_OECONF IIRC. Did you try it?
>
> That would also work, yes.  Is that the preferred style?

At least for me it makes more sense as it is being passed to change
configure behavior so makes sense to be there.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


