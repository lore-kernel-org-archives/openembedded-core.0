Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id E429862062
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 10:53:20 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id id13so2672954vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 03:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=h+qAfJG5//EGoUsO+p6FF2EGolXtDMC98/wfbQn0ZF0=;
	b=Cqux8tNY8Gwm5fbve6KY95nvYjwNWiM8dAPOKaUSxe3WFseWrCMq4ZIYZE1HZ6kaXd
	qTVz7lxMi7e6LeJK+SNdOmG1q+/FfnUzVmiWzQ6so95uq23h2y7i15bfpTJ98yBkgTKL
	RAF1zc5zt0+7R5rSD5ayiAY1/adgnBAFsIucl2u1Jhz+PpgsQZs18T8MQbr4RDhpeHq5
	caqW+M/Bv5nL3JQhmOXgQo3raU+HBh3FiUmjBwWzZo7SRcEl4hTInWtSuBS5jrP/R0Gf
	vu5d6RFX6sW74WBpm5ZkgTNrmz61kFffMNez8m+tnBLkMH+BjCCEv04rnf3Xj/1wLZyo
	Akng==
X-Received: by 10.52.163.46 with SMTP id yf14mr9221471vdb.58.1372762401960;
	Tue, 02 Jul 2013 03:53:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 2 Jul 2013 03:53:01 -0700 (PDT)
In-Reply-To: <cover.1372707180.git.Martin.Jansa@gmail.com>
References: <cover.1372707180.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jul 2013 11:53:01 +0100
Message-ID: <CAJTo0LZKzbC9Mcqp22hX=EkyYPDWD5x4FXRX3sDyHuXnqdxsjA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnspHvB3R/UDPD6ESo/8lXSpzuMXyrPiQAPR3G7l49nzrJa2CxsYwH8C/24lKoxLLLUOOfT
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Fix and cleanup for mesa
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
X-List-Received-Date: Tue, 02 Jul 2013 10:53:21 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2013 20:36, Martin Jansa <martin.jansa@gmail.com> wrote:
> Martin Jansa (4):
>   mesa: Improve gallium PACKAGECONFIG options
>   mesa: fix pipe_loader_sw build without libx11
>   mesa: bump SRCREV in git recipe, refresh patches
>   mesa: remove drirc file

Apart from my comments about the SRCREV bump the rest is good, so
assuming a V2 on that:

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross

