Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1RutyT-0005V7-K2; Tue, 07 Feb 2012 23:57:21 +0100
Received: by pbbb4 with SMTP id b4so28151pbb.6
	for <multiple recipients>; Tue, 07 Feb 2012 14:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=tCViV2r46/fXehVQ1CK1EJWfPvHz0LASzGCtQV1v1ok=;
	b=FEmRxF3Z8Rqg/D+nN+jtbxhkB5gbGR2iPi68+47Qjn2n3RMBXsTeZFSa7ruELeMh5I
	55Lv1hE1gP5irQpy+MCx9gakKsqxQKFdggz7WqivanHMfHXp7NYumZVICywOSNbH8mFC
	7Wc4dK3F6uPZiUPJBm6q3v+F07eW94QWP+Eqw=
Received: by 10.68.219.69 with SMTP id pm5mr62255084pbc.5.1328654958052;
	Tue, 07 Feb 2012 14:49:18 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-142-235.lightspeed.sntcca.sbcglobal.net. [99.57.142.235])
	by mx.google.com with ESMTPS id o7sm170964pbq.8.2012.02.07.14.49.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 14:49:16 -0800 (PST)
Date: Tue, 7 Feb 2012 14:49:04 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120207224904.GC13125@sakrah.homelinux.org>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <29270F77-234D-4561-974D-C8E266898FA3@beagleboard.org>
MIME-Version: 1.0
In-Reply-To: <29270F77-234D-4561-974D-C8E266898FA3@beagleboard.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][RFC] meta-multimedia layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2012 22:57:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/02/12 12:08), Koen Kooi wrote:
> Hi,
> 
> During FOSDEM Paul Eggleton and I discussed moving a few multimedia recipes (libav, xbmc, faac, faad, etc) out of meta-oe into a new meta-multimedia layer hosted in the meta-openembedded git repo. This would allow e.g. meta-baryon to drop a number of recipes while avoiding the need to drag in the complete meta-oe layer.
> 
> Thoughts?

yes idea is fine. Will it then host all multimedia related stuff ? or
just whats in meta-oe is being moved.


