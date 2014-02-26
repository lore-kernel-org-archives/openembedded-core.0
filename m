Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 798476BA1D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 18:13:12 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id j15so2778496qaq.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 10:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vfasJGguePiar0KSg7XOZYJGxxwk5+HjpFY79iZNf24=;
	b=s7d8v5I4DVqiEGT0TzGS7znvv/KdgzihVn9kpgaiwFdmvuKxb7jfyzI2m/YL7NyeQD
	wQn6o3jpJdM8JM31Z4ci0SZymROrItX3k1NdyQFwrNHBOhjh2YkUj+WDfFr4Bw7IMiDd
	oQ8BXaEP/L1kBJvm9/KQ6hba6b6J2D7amnc7JkmU0bGEbfRZ2NLtgsbf81VRyQOiEc4h
	evvhxa/7wekuVQD9wSP0c1Wsd14vBGUS3URPuDaghYLyf3n6ktQYB0/qTZhEMynshaN3
	AwI5cI/iuwO885QYUH4jIwyXBozRfOvPifsvDk4Tmz1jnR7W+NEFayrApMGOJlhww1P1
	Ix/g==
X-Received: by 10.224.160.83 with SMTP id m19mr9996094qax.21.1393438392980;
	Wed, 26 Feb 2014 10:13:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Wed, 26 Feb 2014 10:12:52 -0800 (PST)
In-Reply-To: <7374845.RWAFydePVA@peggleto-mobl5.ger.corp.intel.com>
References: <1393419467-6018-1-git-send-email-diego.sueiro@gmail.com>
	<2631264.Ll8XlRBBiZ@peggleto-mobl5.ger.corp.intel.com>
	<CAMCfZKHM_RsfEOw64nXTc56WJZXAsgzeSBj3xyia81OgB=aeiQ@mail.gmail.com>
	<7374845.RWAFydePVA@peggleto-mobl5.ger.corp.intel.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 26 Feb 2014 15:12:52 -0300
Message-ID: <CAMCfZKFH1sg4d8YJn7HsV_asj_AM-ocGynhtYr4cxH8GvpqozQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Feb 2014 18:13:12 -0000
Content-Type: multipart/alternative; boundary=047d7bacb2aa6e18e904f3532802

--047d7bacb2aa6e18e904f3532802
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 26, 2014 at 3:03 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> The missing part is that libQtUiTools is only built as a static library (by
> upstream intentionally). I did some quick checking and it does appear that
> is
> the case, but if you could add that to the commit message that would be
> great.
> (I can only assume that not many people need to use the uitools module,
> hence
> why this hasn't come up before.)
>

Ok Paul. No problem. Let's see if PATCH v4 will be accepted. :-D

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--047d7bacb2aa6e18e904f3532802
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Wed, Feb 26, 2014 at 3:03 PM, Paul Eggleton <span dir="ltr">&lt;<a href="mailto:paul.eggleton@linux.intel.com" target="_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":1fua" style="overflow:hidden">The missing part is that libQtUiTools is only built as a static library (by<br>


upstream intentionally). I did some quick checking and it does appear that is<br>
the case, but if you could add that to the commit message that would be great.<br>
(I can only assume that not many people need to use the uitools module, hence<br>
why this hasn&#39;t come up before.)</div></blockquote></div><br>Ok Paul. No problem. Let&#39;s see if PATCH v4 will be accepted. :-D<br><br clear="all"><div><div dir="ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>

Diego Sueiro<br><br>Administrador do Embarcados<br><a href="http://www.embarcados.com.br/?utm_source=assinatura_diego&amp;utm_medium=e-mail&amp;utm_campaign=Assinatura%20Email%20Diego" target="_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--047d7bacb2aa6e18e904f3532802--
