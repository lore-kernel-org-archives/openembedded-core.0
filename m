Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF62766DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:51:39 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so30520527qge.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wQALCk3SZXN8EkMWkuc/VRjdLR4KPuPWbQCkkq/r5lg=;
	b=ijzgOL9XbjUn/LFMVvThqhKJhRDKbBGzjXJpH9vTDl53UwffpvM1UcM/kexJ+IEBjc
	1OQu6n5fnjylK32qWvytJHMIOGoAzXXw3slGxnfx7WpFuUXwNjhP63jaN0jxAxJMgdit
	YZneFomLVrtJAY9tXq1gkvmsOEeoLtm6EST/ooWw17WoqCgseYV06jeR0LhjXL0YZylJ
	D2x5237IhP+hTCWtgTaD7BeNk4EGSoI84g6CHW58zh3gTudGjwz6luCTVj2ajLfzYwJL
	UasNUSPTPL5cj3+S2NPsb9rY6m35iQgXnUFFfk4vPSYeIuHkFQuJNlv8ZziYMjfxPYD2
	rKDw==
X-Gm-Message-State: ALoCoQnUeePmM6YgKUUKt0abnGNmQUXjNEEkdqZiyAzLXBstJIO4BOkquBTem6yRTIfk4P1mSr/e
X-Received: by 10.140.145.83 with SMTP id 80mr7184098qhr.17.1440085899728;
	Thu, 20 Aug 2015 08:51:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Thu, 20 Aug 2015 08:51:20 -0700 (PDT)
In-Reply-To: <6b606c162897d5e2e5fb5bca2c57f85a25e685aa.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
	<6b606c162897d5e2e5fb5bca2c57f85a25e685aa.1439991562.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Aug 2015 16:51:20 +0100
Message-ID: <CAJTo0LZgFX7PjbpgpGpVcEVBzfvzsvOgc=Th1umM2HTdo4pC9g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/22] iso-codes: add a recipe from meta-oe
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
X-List-Received-Date: Thu, 20 Aug 2015 15:51:40 -0000
Content-Type: multipart/alternative; boundary=001a11355bc6801047051dc02046

--001a11355bc6801047051dc02046
Content-Type: text/plain; charset=UTF-8

On 19 August 2015 at 14:40, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +# inherit gettext cannot be used, because it adds gettext-native to
> BASEDEPENDS which
> +# are inhibited by allarch
> +DEPENDS = "gettext-native"
> +
> +inherit autotools
>

I fixed the problem with allarch / pkgconfig / multilib today (see my patch
to multilib.conf) so you can bring back allarch to this.

Ross

--001a11355bc6801047051dc02046
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 August 2015 at 14:40, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":1hl" class=3D"a3s" style=3D"overflow:hidden">+# inherit get=
text cannot be used, because it adds gettext-native to BASEDEPENDS which<br=
>
+# are inhibited by allarch<br>
+DEPENDS =3D &quot;gettext-native&quot;<br>
+<br>
+inherit autotools</div></blockquote></div><br>I fixed the problem with all=
arch / pkgconfig / multilib today (see my patch to multilib.conf) so you ca=
n bring back allarch to this.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a11355bc6801047051dc02046--
