Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0C9A76013D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2015 17:48:19 +0000 (UTC)
Received: by wggx13 with SMTP id x13so19117672wgg.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2015 09:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to
	:message-id; bh=6+WLHEYgB3ecAegsB5RCJUdJCZqY8RU4Cos/19Xd5QQ=;
	b=p/bE8nmjCKTP+matTOxtUqHBMfrWUcawiZNXnL5E4kXqhmeLfYwnR3AVbMYFw3+q7u
	DhFqY2dj3Lj/qqnlWBkPBhDtKEz6zYo2lyOXHVXt9Yj0zxmrrZdLf0KBWNsDnui4NUj7
	4aaf/gswl4SrkX8H57dBsDh261S+/ubAZd5hKA6R0mrOoNUkP22/XoyEbKC46uRs9Lad
	GzI3iaArqCwwiqpkHGiWJBxd8I+V9Qm276U8QfqauaxgtaKDhjdI42ikcfrE7CmK4ZuX
	Fi4AxoOqiM8xlM9n4Oz+my9y6ai5GQqyKk9OOG1KYu4yR1ihbsRsCYDrlu9LJKMyfWxr
	cpbg==
X-Received: by 10.180.99.194 with SMTP id es2mr44708416wib.23.1425750500617;
	Sat, 07 Mar 2015 09:48:20 -0800 (PST)
Received: from android-5344fe5e44c2fa60
	(212-60-165-84.adsl.highway.telekom.at. [212.60.165.84])
	by mx.google.com with ESMTPSA id k1sm20226488wjn.9.2015.03.07.09.48.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Mar 2015 09:48:19 -0800 (PST)
User-Agent: K-9 Mail for Android
In-Reply-To: <alpine.LFD.2.11.1503070902110.16088@Device-040570>
References: <alpine.LFD.2.11.1503070902110.16088@Device-040570>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sat, 07 Mar 2015 18:48:09 +0100
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <F503D67F-FDF9-49B6-BBC9-149D56AA3EE4@gmail.com>
Subject: Re: what's with the loop with "in in" in u-boot.inc?
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
X-List-Received-Date: Sat, 07 Mar 2015 17:48:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On March 7, 2015 3:04:52 PM GMT+01:00, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
>
>  based on a recent post to this(?) list, i was curious about the
>following loop construct in u-boot.inc:
>
>        for config in ${UBOOT_MACHINE}; do
>            for type in in ${UBOOT_CONFIG}; do
>                if [ "${type}"x = "in"x ]
>                then
>                    continue
>                fi
>
>  the words "in in" above don't appear to be a typo, as the next
>condition explicitly checks for the value "in" and skips it. what's
>the rationale for that? i used "git blame" to examine the commit that

for may barf on empty iteration input.
One usually uses for i in ${foo} '';
and skips i with zero length. Any other is obviously fine, too though so nothing wrong or odd here.

HTH,

>introduced that, but it says nothing about that curiosity.
>
>rday



