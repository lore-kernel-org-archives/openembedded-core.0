Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 26FEE7FE37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 03:52:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47cPN14fRxzCK;
	Tue, 17 Dec 2019 04:52:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576554721;
	bh=pWdfx0Z1dDNP5xn5kdUWc9AlCjuROFxbaEKMRDS5/Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fyQMJB6ZosAybfYVIHkJQ13vSyZTS59DAqvrcjB1hMvfA8KE44PaCU/ggnkZsdbfR
	RJDdzrxFjxZCJ1+PTdWSyw+BaJ9qB3bVRFC+pVJVnnwAbQ1ZEmZWBLKaroJ7Dbz6sd
	EAydepn/M1BN3ueluxxyDzy5VuR3Q5AfntPPc4XjFrg9/jFrQnSE7AZo/PMla+Fqa+
	+MeC2sbwZUen6dVmB/r9flPyUCQ9bGWsyJGTdQGtgHVL8ecBmFjByCnimT+DGrsbh5
	KagLXt+Seq/bSsiyef6C77YmMppbpS3zuHficHXHMlCKdhLa7jF9wIOtr+nmSOS+e0
	5DLfn1M0nZ+kZnPjTUM/w41olD5d6w4j1aO4SNk3pnthHpYnCpjDhLrbdKshAVkagk
	TgIPPwqVtWe4SxQXhRPXlb/bQ1bC+iTov6c4lqWgOyAeeuhH4aECiNZL3sOXb4bH1z
	/XZoPLBhE1B3k/2O6SyjhuYAl++Oadg68/ovA6x3Zn6e3UMe0wCJpqHwiFLhR6kMLu
	mNC+btiVed7QKoDs1b0PDbBjsGUawPedfHb1EBsxFIivAobAIv9XXGaPReJXWNvcCb
	xhvu+1WFUI3v+trYxmynjLYESVDWU6N0SSuupM8Qr3YLpeIGRQobo7ST6arFftKkzn
	/E8yR3fZINuZo6v2fyIbSlWs=
Date: Tue, 17 Dec 2019 05:51:58 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20191217035158.GB32000@localhost>
References: <cover.1576511913.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud 00/18] thud pull request
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
X-List-Received-Date: Tue, 17 Dec 2019 03:52:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 16, 2019 at 07:59:50AM -0800, Armin Kuster wrote:
>...
> Khem Raj (1):
>   sdk: Install nativesdk locales for all TCLIBC variants
> 
> Ross Burton (12):
>...
>   cve-check: ensure all known CVEs are in the report
>   cve-check: failure to parse versions should be more visible
>   cve-check: we don't actually need to unpack to check
>   cve-update-db-native: don't refresh more than once an hour
>   cve-update-db-native: don't hardcode the database name
>   cve-update-db-native: add an index on the CVE ID column
>   cve-update-db-native: clean up proxy handling
>   cve-check: rewrite look to fix false negatives
>   cve-check: neaten get_cve_info
>   cve-check: fetch CVE data once at a time instead of in a single call
>...

Please also queue these 11 commits for warrior, when they are in thud
they shouldn't be missing after upgrading to warrior.

Thanks
Adrian

