Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id B776960777
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 10:40:38 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id i2so182614953qta.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p34kSrSe0D2HFoPNL7QUOHPN276mIAK3gVwy8dXtfVI=;
	b=RWtRsx66Gms0B3Du2uy19DhSZzGsc8RsHKrt303PanH+JnevKJ/6Jvi0EYpYdgTEny
	B7vB9b8a8Q23A9JISBOq5wVm18rWCJ5ZGlw6jRoyczKVBTxS5OTKM2JTXzGfUAX6M3LD
	+f/Un/2wusZbh140TXPvxJYbbMREudjrJNAbnOLnXDBwjHVBldQicDrmO4Nb9UkhEeIj
	qg5uFTYGM0lHQKlLKMVZMQe+2qV4bcZqrfEvqa7u/WOvYa8Ewaj9sIR0G8RN6BaujtLS
	8vqmvSJGwAIBLnfoMYhZ5M7Qvp4vT657txQjvQi4DZ6pJLvJANdomo+8+S252o8I6IlW
	pP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p34kSrSe0D2HFoPNL7QUOHPN276mIAK3gVwy8dXtfVI=;
	b=qSvuozPYq0auLRphA1HI0aXZEsKJn6COR0/OEMegBOGi9Gnf2S+TnffIXlcoB6hpEs
	ichL42lgh2As8fvgM7Nhtrl2JQHWmjcc/J0UESYXRf/8P4qWa/LfaKSZz15o6uIV6HQb
	IuE63lWzSJ04iQCzM55Rxkj/0GpsSTscTq+XQCyzXYqc5Q4npBZFjpsy0P8Hl49GyG33
	VNVkA0/t+btmS9VMS3OXK1SxDGgGcAsOP03RGlKuwBvpPtbT+foMcf4kfZ2HEcpgAEZA
	57XPeHQZScLmcEuKlmJqkaFX0JSXy3I7c2cZoWoGwgDaGixvftA7ptk8Kr44If+MLEjj
	SIMw==
X-Gm-Message-State: AIVw112DNZKaeqYJEAuRNmBHiv1g69jfWXJFgNvoJvxQxwQ4gMWPxSW+
	vjHSQmEAIb01wUVfFWxpmwFt0FGgPY3i
X-Received: by 10.237.55.105 with SMTP id i96mr28861473qtb.139.1499251239669; 
	Wed, 05 Jul 2017 03:40:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Wed, 5 Jul 2017 03:40:19 -0700 (PDT)
In-Reply-To: <f66a80ddb1ba569ce0e27d561d776a260601ef3d.1499241206.git.kai.kang@windriver.com>
References: <cover.1499241206.git.kai.kang@windriver.com>
	<f66a80ddb1ba569ce0e27d561d776a260601ef3d.1499241206.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Jul 2017 11:40:19 +0100
Message-ID: <CAJTo0LYcbcD4nyo7ota1VB1X1HNQ_77oBAR4SFeTAUQULFGCqw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] openssl: disable weak ciphers
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
X-List-Received-Date: Wed, 05 Jul 2017 10:40:39 -0000
Content-Type: multipart/alternative; boundary="001a113cd01891ed6c05538fa14c"

--001a113cd01891ed6c05538fa14c
Content-Type: text/plain; charset="UTF-8"

On 5 July 2017 at 08:58, <kai.kang@windriver.com> wrote:

> Check distro feature 'openssl-no-weak-ciphers' to disable weak ciphers
> provided by openssl:
>

Would it be controversial to just say weak ciphers should be disabled
globally?

Ross

--001a113cd01891ed6c05538fa14c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 July 2017 at 08:58,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.kang@=
windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":2hu" class=3D"a3s aXjCH m1=
5d11caea015a5c7">Check distro feature &#39;openssl-no-weak-ciphers&#39; to =
disable weak ciphers<br>
provided by openssl:<br></div></blockquote></div><br>Would it be controvers=
ial to just say weak ciphers should be disabled globally?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113cd01891ed6c05538fa14c--
