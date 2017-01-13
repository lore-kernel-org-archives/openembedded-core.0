Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 16F9471DD0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 18:14:05 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id y143so34743232pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 10:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=YYHfjnmZw8t9PSwdkNm4TF2B52LcWiEhN4/bsqKgaxY=;
	b=VaGG94r8WmzE/YtLgENlWvgX5EQPfEXWcu6Amw5vs7rfZdwW5MYveFdegzxt2i98Q3
	MYt2h07ysw3PGcSAnEaU9Y5yCrrZr/qw/+AMRvwtt4SFvAP1sfwyGKWvRC/J805TT7dp
	kMyXATvbC5b5yVCmc6JTPu3NnB89RFnDR1jb01HzhZrnb2AlAee9D6IBifwZyZzGVkvn
	KJmMXOHB0klvmLgnOMaU3euLYzTaFSLE3VTukj/QZjvJ6rvgh1esvCr96jMoKEA7+5pw
	Q/bSMK9jNEO6xyUb9k859z2VUuH2av/dAAn0rhL3LwHfrEzx0GoSAJdCVp6qRe5eyNWC
	MkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YYHfjnmZw8t9PSwdkNm4TF2B52LcWiEhN4/bsqKgaxY=;
	b=mxrGGRSYj/Z9GOyTgTDs7cVnYP5CdrUH5hSgkaoVUmm6KciWogTw+R1lvJq+RVYFf7
	tpXFvwixhjN5n6izOJon8f8ZxHWfJXWtcB5hiCNSwlw2G0P1ZMPqDhdr5Q7lmmtKZ/DC
	ncBKN82hvW/EnoaF/PCox/kf2ZUGYlQamAYMU39I9w9EzpZtThxxr4WwIgDLY1JckZtj
	pzYaiaeJtq08Vd2g9UmUdv+1rZcvA6a3A1JP6R2VQIWtsTliCCiEBvm6b0wuvMEJQ/xu
	2tkbRobO9bgQxStGqNdISUA96W6ATKClys6/VROeLw6fJ9btCHfsSQRZfkTe9yIK20CM
	+c8Q==
X-Gm-Message-State: AIkVDXI/LDO5gYlyrVwqqN2qBY3oMuRE03fdCiYnwdtSRMGYXx2oPHKcCsjbS4Vlz0AZtg==
X-Received: by 10.99.101.65 with SMTP id z62mr26110837pgb.74.1484331245943;
	Fri, 13 Jan 2017 10:14:05 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:4198:472b:7988:3451])
	by smtp.gmail.com with ESMTPSA id
	u64sm30956309pgc.39.2017.01.13.10.14.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jan 2017 10:14:05 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1484331195-11919-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <0206d81b-188d-5ff9-1d22-d7ef560c685b@gmail.com>
Date: Fri, 13 Jan 2017 10:14:03 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <1484331195-11919-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
Subject: Re: [PATCH V2] python3-docutils: upgrade to 0.13.1
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
X-List-Received-Date: Fri, 13 Jan 2017 18:14:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/13/17 10:13 AM, Edwin Plauchu wrote:
> Changed document date field and several notes about folders

sorry to be picking on it again, it seems too vague still. perhaps you
can just diff the two license files are add the diff to commit msg

