Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 68CA86011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 13:55:05 +0000 (UTC)
Received: by igvg19 with SMTP id g19so94418538igv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 05:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=281o4Lxr6GD4b5I339FQ9eucQjgjqW+GuSgBrT4GR5U=;
	b=k/vRt+OTFCgcmFBPG9HxFKBFP4PGIJ430ieTcCQ+0IF9EMUbiDU8v1kOnuSUB0QHJk
	kLcpbHs+z7TT0zVh0CBsZx/8ztFgk9S/LuV0TgvIIxSHkpLh835eU86SCgudmDtCaRAG
	iMXX08WDK97SgQ1cl0GoNE4D3/2oAgvV7HW18+Esd/R2+Cx2CekwzsoRiv2YoVdVa7KI
	mAxaAu5N49/V6oao+PqC1/LDka231X1T+38m5v/fUGl/iXXYgDgbl3Sc+FPMzcg1MzRP
	c41NfAqp62Nlf3OtfaRtJl4pYSLrSWkc/Pm5WYTt0F5ZKJXzeyTK5LVtRzFfA8+ZuSza
	0Luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=281o4Lxr6GD4b5I339FQ9eucQjgjqW+GuSgBrT4GR5U=;
	b=aaAxhapCJNSr0wDl1FSNr/wXECYkrUQPUAlJaYddNeoHlfzstOHTKHHTY2tZnOoU/s
	C3CazZyrRZRLjRa/qPAwVkfrIC8+cB4te2wOT7IXACW2kuA1ILhpO7IAg8lLl8PfYnEU
	lVZCvbBb+YWM9smaBc9Z2pb8QQCFgYRiXtZ9o+aNvjvR4JKQlwzlTYJMnMofld2J+ohb
	eXEQ0R0aVqE3knKucLyxDw1wLUSUK+RiOsXxpBLhatOWRNSgKPG12YBvUz/2Qe0T6svd
	5/EzUSrg1JMeA/Q9jrEWpQ/vX3nPRTQb+fJrwURZnHy2g0r0CWS0t5Fckq5VsBmRQQ5E
	N+7w==
X-Gm-Message-State: ALoCoQnjw+ryAWjT1+BwimXyvNmeNhNpvVQCQ87uUQ/elTLXeTpJ5izF1J0W/G79GHn8YUa+1bM6
X-Received: by 10.50.225.1 with SMTP id rg1mr7373736igc.78.1448978106153; Tue,
	01 Dec 2015 05:55:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 1 Dec 2015 05:54:46 -0800 (PST)
In-Reply-To: <1448924085-26449-1-git-send-email-ross.burton@intel.com>
References: <1448924085-26449-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Dec 2015 13:54:46 +0000
Message-ID: <CAJTo0LZR1Xc2RoOOwYgJDcy-y3Aay6kGt5YN2wrSybDj95Bmcw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] base: don't prefix/suffix packages when expanding PACKAGECONFIG
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
X-List-Received-Date: Tue, 01 Dec 2015 13:55:07 -0000
Content-Type: multipart/alternative; boundary=001a1132f15e4e17490525d681dd

--001a1132f15e4e17490525d681dd
Content-Type: text/plain; charset=UTF-8

On 30 November 2015 at 22:54, Ross Burton <ross.burton@intel.com> wrote:

> When handling PACKAGECONFIG don't add nativesdk- prefixes or -native
> suffixes to
> packages, as the classexpand logic will run next and so the same operation
> again.
>

Retracting this, whilst this works for nativesdk the native path is ordered
differently and the remapping happens before packageconfig so libsdl-native
will depend on libx11 (not libx11-native).

Ross

--001a1132f15e4e17490525d681dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 November 2015 at 22:54, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":43s" class=
=3D"a3s" style=3D"overflow:hidden">When handling PACKAGECONFIG don&#39;t ad=
d nativesdk- prefixes or -native suffixes to<br>
packages, as the classexpand logic will run next and so the same operation<=
br>
again.</div></blockquote></div><br>Retracting this, whilst this works for n=
ativesdk the native path is ordered differently and the remapping happens b=
efore packageconfig so libsdl-native will depend on libx11 (not libx11-nati=
ve).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a1132f15e4e17490525d681dd--
