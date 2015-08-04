Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6678C759C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 16:26:08 +0000 (UTC)
Received: by ioea135 with SMTP id a135so22285955ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 09:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=Xu+fchQQZJMila//iPHJEQheqiBJb6HxyygSl9nYTtA=;
	b=Rs3FVLTSfMVYgVYewk3xr3yWEf7WEVvv+YfgX69/mQc4M683KAeSD3wD+sG10v+b6Q
	u3l45U1M//OLkHD2/Pgi64UuqCuGmFbcNbtAlelrXoWwUF5+R6JW1SUiaYm3CdF+RMvT
	v95D/sTEbFzKN4/9mfyLkNPYjx991RVCdXjQTF982wINsd5hXjjQhbrLKN3LmwX2jP4y
	JQAuHjOuXTgYrRkOlQZqpPTxkiOntKtYSQ7EaCTyJYgIwwQh4tQc5VDRso3s+kwyyqtD
	5cCxTT5aQXufnLNCjbHi2FbhUhHWoCVkbUsLXi8c3essh+RTGxv1JWb1wiBep46qwE5x
	0o0Q==
X-Gm-Message-State: ALoCoQn0ZmAlTRiNEPZaNZYtsppGtrswO7U3D6HnxoUfq+NVzW/2HWxfP6i60PPiQFGcmcZ9YC7X
X-Received: by 10.107.136.160 with SMTP id s32mr4333646ioi.174.1438705568970; 
	Tue, 04 Aug 2015 09:26:08 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CA2B.dip0.t-ipconnect.de. [93.232.202.43])
	by smtp.gmail.com with ESMTPSA id
	bd7sm1390303igb.19.2015.08.04.09.26.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 09:26:08 -0700 (PDT)
Message-ID: <1438705566.29509.139.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 04 Aug 2015 18:26:06 +0200
In-Reply-To: <f4ee80aed6d6c20ba6c01e92ec1495a5d20d6a58.1432122320.git.patrick.ohly@intel.com>
References: <cover.1432122320.git.patrick.ohly@intel.com>
	<f4ee80aed6d6c20ba6c01e92ec1495a5d20d6a58.1432122320.git.patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] combo-layer: handle unset dest_dir in sanity_check()
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
X-List-Received-Date: Tue, 04 Aug 2015 16:26:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Please ignore, I accidentally resent this pull request.

On Tue, 2015-08-04 at 18:20 +0200, Patrick Ohly wrote:
> The previous "clean up dest_dir checking" patch (f8cdbe7497) improved
> handling of empty dest_dir but made handling of unset dest_dir worse:
> instead showing the "Option dest_dir is not defined for component ..."
> error, it fails with a Python exception.

...



