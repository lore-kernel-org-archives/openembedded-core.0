Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1SpJvX-0006SC-KA
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 15:59:31 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 12 Jul 2012 06:47:10 -0700
Received: by yenq6 with SMTP id q6so2254696yen.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 06:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=S8UY53VwhvLNY4XLoIx3rdZy2FSwt21HF05EvV4zVgc=;
	b=FbMHtgb7gJjsEmVJQAstt0S/LHlBZwlrqVSQwIn4KfYWppbRpzBLwDjp3U0C1aETxp
	xKHsQf8La4eqQu5NWiY5nxSZzThyQSmfd+LTUnVYLIPMnmL9tgUGmhNGHRExUtC/Rnm+
	hWEm/f2w6Z8nRlFVd2Lq0Jg/6M+LNibDjAfch9rWLGeZUIOOO273xtz22uGhZFkHkLJm
	POCVX5isB1k9WLLYDhPipBmnx19TNX6z9rhQhuarxutjX8WGNNQzdoWcprl1/eaO+wjH
	kBGYqaifqLoixCyuMqNWl9RcKwPGTfzCsEKsMzLgjDQmrL7s9kxisXKVSxEXDIO3hqAI
	5dDw==
MIME-Version: 1.0
Received: by 10.236.146.97 with SMTP id q61mr61580000yhj.113.1342100828792;
	Thu, 12 Jul 2012 06:47:08 -0700 (PDT)
Received: by 10.236.144.131 with HTTP; Thu, 12 Jul 2012 06:47:08 -0700 (PDT)
In-Reply-To: <1901411.bouqtbEZ1W@helios>
References: <CAJ2CSBuJYeUMYEa8RycpMzZA551xoR0Fe5QJi8GgBg7f=C1PLA@mail.gmail.com>
	<CAJ2CSBt+NSLH0_WhdDfMN8GUw5epy_u31aeESaZxT=7rQ90WfQ@mail.gmail.com>
	<1901411.bouqtbEZ1W@helios>
Date: Thu, 12 Jul 2012 16:47:08 +0300
Message-ID: <CAJ2CSBvTn+QVaUwLPtnExaD6RtCapiJsiFTgTKxbT0tm-HqojA@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQkYywjqcx6mHhdI1xaRMlMGAIZks+0SZZ8ANUDiOztlcap7c2f6OHsGeRK9eEm5uBeJxXGy
Cc: openembedded-core@lists.openembedded.org
Subject: Re: python error when building various packages
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
X-List-Received-Date: Thu, 12 Jul 2012 13:59:31 -0000
Content-Type: multipart/alternative; boundary=20cf303bfc882728f404c4a23366

--20cf303bfc882728f404c4a23366
Content-Type: text/plain; charset=ISO-8859-1

Done https://bugzilla.yoctoproject.org/show_bug.cgi?id=2752

Alex

On Thu, Jul 12, 2012 at 12:34 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Thursday 12 July 2012 11:56:16 Damian, Alexandru wrote:
> > Solved by do_clean on the packages.
> >
> > Still Alex doesn't know what triggers the error.
>
> I'm not sure either, but would you mind filing a bug for this?
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--20cf303bfc882728f404c4a23366
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Done <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2752">h=
ttps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2752</a><br><br>Alex<br>=
<br><div class=3D"gmail_quote">On Thu, Jul 12, 2012 at 12:34 PM, Paul Eggle=
ton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" =
target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Thursday 12 July 2012 1=
1:56:16 Damian, Alexandru wrote:<br>
&gt; Solved by do_clean on the packages.<br>
&gt;<br>
&gt; Still Alex doesn&#39;t know what triggers the error.<br>
<br>
</div>I&#39;m not sure either, but would you mind filing a bug for this?<br=
>
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br>

--20cf303bfc882728f404c4a23366--
