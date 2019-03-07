Return-Path: <max@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 28BBF7CEBA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 13:27:37 +0000 (UTC)
Received: by swift.blarg.de (Postfix, from userid 500)
	id EB1972201C3; Thu,  7 Mar 2019 14:27:37 +0100 (CET)
Date: Thu, 7 Mar 2019 14:27:37 +0100
From: Max Kellermann <max+openembedded@blarg.de>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190307132737.4gdibq65rzqwdjcy@swift.blarg.de>
Mail-Followup-To: "Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <20190307131832.27205-1-max+openembedded@blarg.de>
	<CAJTo0LYAOqVjJhGwKqNz0j48QP1LEazdCzj432=pw-i+qpe=Ew@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYAOqVjJhGwKqNz0j48QP1LEazdCzj432=pw-i+qpe=Ew@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsndfile1: make sqlite and FLAC/Vorbis optional
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
X-List-Received-Date: Thu, 07 Mar 2019 13:27:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2019/03/07 14:23, "Burton, Ross" <ross.burton@intel.com> wrote:
> I just double-took at the sqlite dependency.  This is only used by a
> testing tool that we don't build or install.
> 
> How about renaming the option to regtest and disabling by default?

What do you think about disabling it unconditionally?

