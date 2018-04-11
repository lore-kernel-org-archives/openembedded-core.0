Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id C30D974616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 00:02:45 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id q71-v6so46679oic.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 17:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=avmMIGcNc7rhaPZVagmguE9Qmo3pMMThA70JZ2IMAEE=;
	b=2NDCrFefakCFxCczHViX4TGEjsp/V5iD8g8N8x4a2P1/iLaIzF1AvkaYGCySIFBIaE
	IciC7JGAOL9u4pOLWVzMVsy4Zi6hZe+3naCpimLt4M7SHadyi9eVHD4bXakQroSXd3+n
	Ai+tSswueyUnSgdbLn0vlLk5ygmH7EbrMzk3Cyikn29BmMvZ4pQxNdLYRN3KcjWrUMrt
	r+y5QbFS35ES5dR4lnoFvdjeBhvsEDfWdwhCLqrADS+tUGw2AX65A8x0U79iAPkzujK1
	wgAEqf3TbWw45ErH0L5nMRcEGFthTx9WRYYVf58e1A6MC0kwNGeITlyZMesnDewCtpJh
	AjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=avmMIGcNc7rhaPZVagmguE9Qmo3pMMThA70JZ2IMAEE=;
	b=cymYVQea46yrKY7x1L2t/8cwl3al7wZzsbECH59IGMYQcrg9LCLdQ80O8iQyjjSfyL
	omQG4iLwXKX4pnKtW8ItDFKcNjA37reuiHWDA195IOb33iZzZXJlHw9Lortlbtn1fV41
	nlJk1dE6uUlgqIKeRPujpUP7Vh8h6TA5J5ztLvP808E+FS7ig8RvGs3Ap+7byLZwMlKv
	AGskAInSQugvh898l+R4sRmIM494S6x2Pj3eG0iE7ZJk9DFR+7luytTxUvuOrQMJJNL9
	J1XNdkt2IlG+Hzpy8TnVpUJcL8kybyH645GaUA89Ix96/3GKox+84LqrSkQ7YSfyBCzG
	MoJA==
X-Gm-Message-State: ALQs6tC7T3vnh4cerOhEbFGmlElU8QiEbk1Gh/JJZkqUPQEzglpwoSRc
	h6OtJrgrRSKvX4RyHDZ8chRP4tEzDhQy7ifYrns0aw==
X-Google-Smtp-Source: AIpwx49Lc+I3U3TjMn4/0uLf3bEPKzTT0sP2xl9Xb7QLPvvLdqspO3MoE4kRDoz0NPihj6i+zieMKHYfPmkCOzKPkEU=
X-Received: by 2002:aca:acd1:: with SMTP id
	v200-v6mr1675465oie.320.1523404966463; 
	Tue, 10 Apr 2018 17:02:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.79 with HTTP; Tue, 10 Apr 2018 17:02:23 -0700 (PDT)
In-Reply-To: <1523044641-56994-2-git-send-email-juro.bystricky@intel.com>
References: <1523044641-56994-1-git-send-email-juro.bystricky@intel.com>
	<1523044641-56994-2-git-send-email-juro.bystricky@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Apr 2018 01:02:23 +0100
Message-ID: <CAJTo0LZFV2t1sjTaOrFfZWqTAcm49qUCj-fvpOxRdkD-+wQhDA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-xcbgen_1.12: improve reproducibility
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
X-List-Received-Date: Wed, 11 Apr 2018 00:02:46 -0000
Content-Type: text/plain; charset="UTF-8"

On 6 April 2018 at 20:57, Juro Bystricky <juro.bystricky@intel.com> wrote:
> In order to remove timestamps from all .pyc files we need to recompile
> them with python3-native, as we cannot rely on the host python being
> able to do that. Both python-native and python3-native derive the timestamp
> from SOURCE_DATE_EPOCH if present.
> However, building python3-native can be computationally expensive, so
> we resort to python3-native only when building reproducible packages:
> (BUILD_REPRODUCIBLE_BINARIES = '1'), otherwise we use the host python3.

The logical extension of this is that every recipe that ships .py
needs to depend on python3-native so that it can recompile.

However, there's another solution...

.pyc files are basically a four byte magic number, a four byte
timestamp, and then the byte code.  It won't be that many lines of
Python in a do_package[postfunc] to search for __pycache__/*.pyc files
in the packages and replace the timestamp with SOURCE_DATE_EPOCH if
reproducible builds are enabled.

Ross

