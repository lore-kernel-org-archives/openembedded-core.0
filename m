Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1735E60DFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 10:54:34 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id l6so1012540oag.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 02:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3mLOYqNDBDLdT4Ju4N2OIQs1BGtjNh2O415chWGdxG8=;
	b=eooYAJ4LARS/yarGR0PjwODr/lS8d0O7yO4CQeuLFkkfQftrjaOOhZwk5ad3A4lZKT
	Ww8vRx8mtBPMIwT0K8y8epKLEr68y2bnstpLCnS4YzXAlDA6fCpStWbQSv813WVqBRIK
	SJA+Wzde0QCYK3TwOhQ/TbdOyMXDXrsWi9U5yuOPS6YEiZjfwqCuGlgCvUx5C2OuHrEn
	VNnlx24gwRY/BNwIC5wo8MR5gtqlFcsteNEnAbdQbCs07d3tNMTLsj2BcQS8Fxt4oQ3G
	CgF3KYraDtdru4l0Kseed6+1tuKN8MUsuc1jlB6h/Kz9jjewH0Uie2NaEo/wYUVvezHp
	U5/g==
X-Gm-Message-State: ALoCoQmqjU+X4YrK/hOTCBBFo2lHvHlIuYr63bMzngXVvGD3vOHciNCXPeKdZGsisbsdf0Q0VTjO
X-Received: by 10.60.52.177 with SMTP id u17mr675476oeo.24.1387450474569; Thu,
	19 Dec 2013 02:54:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.122.81 with HTTP; Thu, 19 Dec 2013 02:54:14 -0800 (PST)
In-Reply-To: <52B2CED8.3020707@digi.com>
References: <1387276932-26461-1-git-send-email-paul.eggleton@linux.intel.com>
	<52B2CED8.3020707@digi.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 19 Dec 2013 11:54:14 +0100
Message-ID: <CAP71WjxnUnjL8b1yQxGsiaReLUbavc5kh4zQ2YeT9kHfv6UjVw@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsoup-2.4: add intltool-native to DEPENDS
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
X-List-Received-Date: Thu, 19 Dec 2013 10:54:34 -0000
Content-Type: multipart/alternative; boundary=001a1133056aae3c8604ede0fc4f

--001a1133056aae3c8604ede0fc4f
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 19, 2013 at 11:47 AM, Javier Viguera <javier.viguera@digi.com>wrote:

> On 17/12/13 11:42, Paul Eggleton wrote:
>
>> -DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3"
>> +DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 intltool-native"
>>
>
> +1 for this change.
>
> I was bitten by this bug using a DISTRO with no X11 support (removed X11
> from DISTRO_FEATURES). In that case the 'intltool-native' dependence is not
> fulfilled and libsoup fails to build.
>
> Could it be *backported* to Dora/Dylan?


it will. Paul said on IRC the other day, that it should reach dylan by the
end of this week .

--001a1133056aae3c8604ede0fc4f
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Thu, Dec 19, 2013 at 11:47 AM, Javier Viguera <span dir="ltr">&lt;<a href="mailto:javier.viguera@digi.com" target="_blank">javier.viguera@digi.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="im">On 17/12/13 11:42, Paul Eggleton wrote:<br>
<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
-DEPENDS = &quot;glib-2.0 gnutls libxml2 libproxy sqlite3&quot;<br>
+DEPENDS = &quot;glib-2.0 gnutls libxml2 libproxy sqlite3 intltool-native&quot;<br>
</blockquote>
<br></div>
+1 for this change.<br>
<br>
I was bitten by this bug using a DISTRO with no X11 support (removed X11 from DISTRO_FEATURES). In that case the &#39;intltool-native&#39; dependence is not fulfilled and libsoup fails to build.<br>
<br>
Could it be *backported* to Dora/Dylan?</blockquote></div><br>it will. Paul said on IRC the other day, that it should reach dylan by the end of this week .</div><div class="gmail_extra"><br></div></div>

--001a1133056aae3c8604ede0fc4f--
