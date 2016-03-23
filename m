Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4993160290
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:55:59 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id x3so29199124pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 06:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=MZHWCVpHkYTwwQeIiq7UjZjMBURlXGq/Dc//Vd0bxKY=;
	b=ax3w8yfloexn8/J+kxQBqm6Ymy8Op0rvYchpt35rNqTkVxp33CA25ykU41waCRwos7
	MruZlV4YfGwSCOeSNjwYzQ5UwseKppGa9eaxB5bt7S59L0iH2x18KsUAqjCF1XOLuruM
	9w6Ah5BmPOUZl8SYqEPDEuxppNdWBz1TIWc760Iw/sGxyS9r5Jgh0PqFN/078pqKv7ek
	mVPvqfthpFhgVAto26iwP/BsPzaOQqXSrSnW+/Ig+fCN+MTfEgunGM2nMs84noYik1R/
	Pt4SoRplR4KKzlAExuq3B1OYUMclxFljxYhWWIoLmP45q6LXMm5P5c8h6IBNmxbui/Cj
	PTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=MZHWCVpHkYTwwQeIiq7UjZjMBURlXGq/Dc//Vd0bxKY=;
	b=Ss5nKksyymlIx7OD/VuLX4VEBk9IlUTcRBdOMkUuRsY4YfQ7eGf/RntbxsqSuPcrP1
	/iO9Qnw1Eq0gZwdP9grdM34PQiYBJGz+YVtwbKYAonLj8XA/uICqb2ldq3it7bpic7X0
	TiHmia5/93z7G2Vebeix8nXGULa8peGRZ54SSM1RzZZ74xCqS72qdbQJO+1OP8bW5q4L
	zq2nOy8zYo0TuemEW9KVe4XCd0BC+/8/E7AhSUzqMi7Bjhho7bFilctnh+Xx2uGlx8qi
	NTfbi42zv7wapA0bMA0wAQx8lPw00VouD9QTA1G8sO3GhiA9dO14Hb++KNQCWaBdiAXP
	PtEw==
X-Gm-Message-State: AD7BkJKA61kg4RcnMaRVevIy/04IpqDyA8pHm0pX/9OGb1Cf7L9J56PdBsgqSgkK3/N5nw==
X-Received: by 10.66.244.233 with SMTP id xj9mr4473519pac.19.1458741347359;
	Wed, 23 Mar 2016 06:55:47 -0700 (PDT)
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com.
	[209.85.192.180]) by smtp.gmail.com with ESMTPSA id
	g28sm4607822pfd.25.2016.03.23.06.55.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Mar 2016 06:55:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f180.google.com with SMTP id u190so29256768pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 06:55:45 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.74.200 with SMTP id c69mr4438044pfj.129.1458741333139;
	Wed, 23 Mar 2016 06:55:33 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Wed, 23 Mar 2016 06:55:33 -0700 (PDT)
In-Reply-To: <56F29A68.5030905@linux.intel.com>
References: <1458680136-5455-1-git-send-email-ross.burton@intel.com>
	<56F29A68.5030905@linux.intel.com>
Date: Wed, 23 Mar 2016 10:55:33 -0300
X-Gmail-Original-Message-ID: <CAP9ODKprhT0JkdBt-7fqUdxMOhjhAp1kCMncQ2tO0JxV6_jzqg@mail.gmail.com>
Message-ID: <CAP9ODKprhT0JkdBt-7fqUdxMOhjhAp1kCMncQ2tO0JxV6_jzqg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Python 3 as oe-core default?
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
X-List-Received-Date: Wed, 23 Mar 2016 13:56:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 23, 2016 at 10:30 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 03/22/2016 10:55 PM, Ross Burton wrote:
>>
>> Ideally this would be an option but that means conditional inherits.  For
>> now
>> Python 2 is clearly the default Python in oe-core so switch to Python 2
>> instead
>> of 3.
>
>
> Shall we start the work towards making 3 the default though?

2.2 material please.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

