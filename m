Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id A3FC974743
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 04:48:32 +0000 (UTC)
Received: from [192.168.0.106] (cpe-174-109-247-98.nc.res.rr.com
	[174.109.247.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A02032084D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 04:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1538714913;
	bh=ZdgU5uo/fzVdQDSmzVJE+gHAA+brRNG3IC+YCpKhZMw=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=DCxO7t0UEcKBBQ/N/pZWh1Hv3OThuC4cHxGxC8GV2LuRfu/U3WrVhMM7Opcu6e2/L
	hmK6xTho6TRR5OIsgS//k6oSexS6EJ5TwMl4Vt0c/RbUm2p6yYR944clSPvltmNQDb
	JYIilcFM5fv36aLYD8j0Wu3H/JOborIvp5DZPzh4=
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20181005035515.4922-1-okaya@kernel.org>
From: Sinan Kaya <okaya@kernel.org>
Message-ID: <3dca9fca-cea6-4830-b28f-805490b3bbfd@kernel.org>
Date: Fri, 5 Oct 2018 00:48:32 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181005035515.4922-1-okaya@kernel.org>
Subject: Re: [sumo] [PATCH v1 1/2] ncurses: CVE-2018-10754
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
X-List-Received-Date: Fri, 05 Oct 2018 04:48:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/4/2018 11:55 PM, Sinan Kaya wrote:
> * CVE-2018-10754
> A NULL pointer dereference was found in the way the _nc_parse_entry
> function parses terminfo data for compilation. An attacker able to provide
> specially crafted terminfo data could use this flaw to crash the
> application parsing it.
> 
> Affects < 6.1.20180414
> 
> CVE: CVE-2018-10754
> Ref:http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-10754
> Signed-off-by: Sinan Kaya<okaya@kernel.org>

Self NAK on this ncurses patch only. This broke docker.
The rest of the patches looked good to me.

