Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id 2749A786A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 17:58:18 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 638732ADD00;
	Fri, 15 Sep 2017 12:58:17 -0500 (CDT)
Date: Fri, 15 Sep 2017 12:58:15 -0500
From: Seebs <seebs@seebs.net>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20170915125815.29a4a6e3@seebsdell>
In-Reply-To: <20170915115848.4939-1-ross.burton@intel.com>
References: <20170915115848.4939-1-ross.burton@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] useradd: don't override pseudo environment
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
X-List-Received-Date: Fri, 15 Sep 2017 17:58:19 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 Sep 2017 12:58:48 +0100
Ross Burton <ross.burton@intel.com> wrote:

> Remove the PSEUDO_LOCALSTATEDIR assignment and inherit the correct
> assignment in FAKEROOTENV.

Nice catch! This probably explains a LOT of the strange behaviors we've
been seeing.

-s

