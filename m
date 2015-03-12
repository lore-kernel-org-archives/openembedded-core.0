Return-Path: <tf+lists.yocto@r-finger.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Mar 2015 18:09:58 UTC
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id AE78173954
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 18:09:58 +0000 (UTC)
Received: from [192.168.0.4] (unknown [213.122.222.218])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 8A13F9513;
	Thu, 12 Mar 2015 18:02:51 +0000 (GMT)
Message-ID: <5501D4CA.2090209@r-finger.com>
Date: Thu, 12 Mar 2015 18:02:50 +0000
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.3.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
References: <20150312143521.GD2338@jama>
In-Reply-To: <20150312143521.GD2338@jama>
Subject: Re: meta-gir issues and maintenance
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
X-List-Received-Date: Thu, 12 Mar 2015 18:10:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Martin,

On 12/03/15 14:35, Martin Jansa wrote:
> I was trying to use meta-gir in Dizzy release and found out that last
> commit in this layer is 16 months ago and many .bbappends no longer
> match with their recipes.
> 
> Was this layer superseded by something else or you just didn't have time
> to update it for newer Yocto releases?

Unfortunately, life has been getting in the way of working on this layer
(as well as meta-guacamayo), and it is not going to change in the
foreseeable future. :-( It's a pity, as the gir stuff is
useful/necessary for things like python bindings to gobject and related.
If someone wanted to take over, it would make sense to move the repo
somewhere more central (yocto, oe) as well.

Tomas


