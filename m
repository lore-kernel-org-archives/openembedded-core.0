Received: from mail-lb0-f172.google.com ([209.85.217.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TyVkE-0006hm-6Q
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 23:58:06 +0100
Received: by mail-lb0-f172.google.com with SMTP id n8so6415465lbj.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 14:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=7/DuHlRsnejzkOhnD9IS7hhk1L94rIhf1uBNR4a5MS0=;
	b=LUjHAr+UF/1hGlSaKN8YSHAL1Qkbw/PrV8UiQ891mLro3GVxA3Ll/l47w5Pq1TCm2y
	kNKyUFhWdmu/YkvVw7dt/sG6Hw7Jdy93y0WEqa9UTBxpVezfoHEnvTKuIgIzYKPISdfD
	bDvjzHE4Fj6qaPaVUJVaUI7YKb/mTm7A4UVx/bljGJKiM8FXx36UDr2pfTnoZrhD/7ue
	zfEjXpHtsOw4PbViK9VPFpX2KEtAos1K/bfmbNy0veHGno8bVbPdkBjRNJePOtqL5/LA
	Xf028EBRd90DcTbpT5W8fdkGe9DvohOZi8b/xEUcoxztH2meOsgMN2NYAquTbpZDMdf3
	0MlQ==
X-Received: by 10.112.87.194 with SMTP id ba2mr1434248lbb.84.1359067352645;
	Thu, 24 Jan 2013 14:42:32 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Thu, 24 Jan 2013 14:42:12 -0800 (PST)
In-Reply-To: <CAMKF1spCF8ZQ86skFu_V0PHy7_r4n=h3d_6cNF5t3-x36dkoRA@mail.gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
	<2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
	<1359064215.3616.20.camel@ted>
	<CAMKF1spCF8ZQ86skFu_V0PHy7_r4n=h3d_6cNF5t3-x36dkoRA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 24 Jan 2013 15:42:12 -0700
X-Google-Sender-Auth: _1uSMqi06kaXGK95uMZCSl-63_I
Message-ID: <CABcZANmaExGvf_4Vm-+00nkk905an8atzPPR946KOsOWGpwYvw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] libpcap: Add missing libusb dependency
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
X-List-Received-Date: Thu, 24 Jan 2013 22:58:06 -0000
Content-Type: multipart/alternative; boundary=f46d0401fdffc7c25804d4108608

--f46d0401fdffc7c25804d4108608
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 24, 2013 at 3:14 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jan 24, 2013 at 1:50 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Do we need libusb support in libpcap? What does this dependency buy us
> > and couldn't we force it off instead?
>
> its needed to support canusb in libpcap, I would say yes we should
> support it but disabling it would be ok too although all my builds
> were silently using libusb so I think unknowingly may be but we are
> already shipping with canusb support.


I'd personally prefer it disabled, but I'd think at the very least it
should be a PACKAGECONFIG entry, whether its included in the default value
of PACKAGECONFIG itself or not.
-- 
Christopher Larson

--f46d0401fdffc7c25804d4108608
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Thu, Jan 24, 2013 at 3:14 PM, Khem Raj <span dir="ltr">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="im">On Thu, Jan 24, 2013 at 1:50 PM, Richard Purdie<br>
&lt;<a href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; Do we need libusb support in libpcap? What does this dependency buy us<br>
&gt; and couldn&#39;t we force it off instead?<br>
<br>
</div>its needed to support canusb in libpcap, I would say yes we should<br>
support it but disabling it would be ok too although all my builds<br>
were silently using libusb so I think unknowingly may be but we are<br>
already shipping with canusb support.</blockquote></div><br>I&#39;d personally prefer it disabled, but I&#39;d think at the very least it should be a PACKAGECONFIG entry, whether its included in the default value of PACKAGECONFIG itself or not.<br>

-- <br>Christopher Larson</div></div>

--f46d0401fdffc7c25804d4108608--
