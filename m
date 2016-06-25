Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 06E0260043
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 15:11:31 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hf6so11489704pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=bjcOjA3Pc+Ci3nLpNix0eAYKk+il2+1EPLPQFDylvy0=;
	b=Om7ZZfE0b0YPOniRxcCgTLhFjnOkZGtAYpqi96kEF6X7W8Dfm4VAuo7D3IJYfkXbe3
	wLhhK9BpWpgJqf8JXoMFUObmmWx2Yy0J9U76FLUg87x7u/SJTh7p2IEgSzkdLYBoROkY
	wS7aUrZWll7UB56df1M+7gOguDX7a80kwVcpJ2IZDL5Gkd2kPvnMyzO1szX8MUHOxhkp
	IFMr7wAydPSgcSXcW05hCincMikj4jJGKwveJ0PHNvUnuxnOVcf65pGkTGEgXQzqjksq
	2J0As+dl25jv8zn8jUbdRRvcGYZCV5WnMUNtFzsdA3KVBUBcoiNzXdB6d0S0rPoXADBO
	RRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=bjcOjA3Pc+Ci3nLpNix0eAYKk+il2+1EPLPQFDylvy0=;
	b=fdn5m8JvTMgnObnFpTQMsqmbvrz23nimnMGRwybxFP40dsOcRa3sBWvipWpg5R0jUG
	o/5ldKmeodfS4qnIJAKqfRRnFExxeKwHkY8Q/FsxL92HwrsgMe6C604Up8S7plDBplY5
	p5TUXbG3SC24YAzo9d7GL528so/5DRbhhk43bScIkPAnZARwm+7hIcQdsKR3Hds4KZ6M
	w2eb5cN69FxpEDnvtpCunGtGrTVBOJXc9XIi7URXwucfFrrx+SIUuSSQcMb4rZDT06n2
	EXGualrfLh0NBtvJ79+pulqlAHgPA2Ke1gBhn8r3+we3CU0swgJ6v0kZ+6pGKBDXi0HP
	GrQA==
X-Gm-Message-State: ALyK8tJrrbWNYa1pgU58OmijiywSLgGtHlDbxWJGXuQxzcDlp+DlRnc8QyzfL/QVLgORCA==
X-Received: by 10.67.3.105 with SMTP id bv9mr17553084pad.29.1466867492573;
	Sat, 25 Jun 2016 08:11:32 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:60ad:4dfb:8f30:e657?
	([2601:202:4001:9ea0:60ad:4dfb:8f30:e657])
	by smtp.googlemail.com with ESMTPSA id
	o6sm650136pax.9.2016.06.25.08.11.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Jun 2016 08:11:31 -0700 (PDT)
To: Stephano Cetola <stephano.cetola@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20160622193552.14761-1-stephano.cetola@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <576E9F21.3050608@gmail.com>
Date: Sat, 25 Jun 2016 08:11:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160622193552.14761-1-stephano.cetola@linux.intel.com>
Subject: Re: [PATCH][for-krogoth] backport staticid fix
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
X-List-Received-Date: Sat, 25 Jun 2016 15:11:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

staged for krogoth-next

thanks,
Armin

On 06/22/2016 12:35 PM, Stephano Cetola wrote:
> I've backported this from master and tested.
> 
> [ YOCTO #9777 ]
> 
> Peter Kjellerstedt (1):
>   useradd-staticids.bbclass: Restore failure on missing UIDs/GIDs
> 
>  meta/classes/useradd-staticids.bbclass | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 

