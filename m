Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 395966FF01
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 14:26:09 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f206so25135424wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 06:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=vxdxyZdmZff1MTlWt2gi7zKS2/bw/RdQWBBB/VCsPAM=;
	b=ZTWVIMNxnRyEhpicPsqEHApJrn0xA0QTvi3HSubzZcrQEUE3VkQ91PN+SPxJOuh4fw
	GjmRIkvX590dYGsAPZouAMqcJyyto1bblAFjg2UAUlVwhuImVM6gCIfLai+yyxCxRHKV
	HzMSpLClBgMukw18I/eE8SnXE6IqH7EE7bPg96M99x7v0UD2zhVfkfcJoLTZ5tLH0Yav
	GhEw9dul9LbBT8JaQj6B+oUNJvpO1j0jk/+haRi3t4ahN+aHv16J9nQCZQltIY0yGtBO
	2KkJDStFroxCCzlu3upGVM/1TV3qx0TbcajqpsiezUEql9TYWiQY1rrK38P1N/qIVO/F
	/Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=vxdxyZdmZff1MTlWt2gi7zKS2/bw/RdQWBBB/VCsPAM=;
	b=j+2yQTigMYIUP0Wz+5n7gXo1Ejy1hnG++hXD6rMCyJEqyB2T27YeNP1tOCk7QLmDg7
	F80SGPORpOJZybAdwMbq1e3ZEEVxUp1gQ1MFQ5FToxBa+Rq6fQySOCQJKuUT3l5k0VYV
	33cOtYKIdHR7Vb7IyvlYoml4kN+JKRK4KGFl1tpBedyJHd5C5/DuhpEsxLG2sFx3o6K2
	xXG18PTntgvSD3XtVqRb3cYr89++hBZGfslS4qKJOAwBs6cUCzY9dbIFppQ6IXqgqsbr
	NNhhVyRVl0RcPM1A26b3uYqI1NhtwRtt9qqr6qYcOJ9BMEiJi11N2tCe88yB9hmnJCJY
	W8fQ==
X-Gm-Message-State: AG10YORABTMLFEXw3uyJjiENfWTpmpzAxcTRZ0wRFab/X01znu41Bh4rvym8Q2lLrRQ2CQ==
X-Received: by 10.28.54.209 with SMTP id y78mr3956707wmh.26.1452867970249;
	Fri, 15 Jan 2016 06:26:10 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	t195sm2769016wme.13.2016.01.15.06.26.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jan 2016 06:26:09 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Christopher Larson <clarson@kergoth.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <5698E002.5090800@dresearch-fe.de>
	<1452863169.28375.161.camel@linuxfoundation.org>
	<5698F31E.1020905@dresearch-fe.de>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <56990180.9080407@dresearch-fe.de>
Date: Fri, 15 Jan 2016 15:26:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <5698F31E.1020905@dresearch-fe.de>
Subject: Re: fido -> jethro switching problem
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
X-List-Received-Date: Fri, 15 Jan 2016 14:26:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 15.01.2016 14:24, Steffen Sledz wrote:
> And I made another interesting discovery: The exception appears on certain machine types only, e.g with qemuarm it appears, with qemuarm64 or qemux86 not.

It seems that all machines based on armv5e are affected.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

