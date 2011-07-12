Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgdfT-0000G0-GB for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 16:10:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CE6WcC020948;
	Tue, 12 Jul 2011 15:06:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19843-08; Tue, 12 Jul 2011 15:06:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CE6QgM020942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 12 Jul 2011 15:06:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
In-Reply-To: <0c648be94c7e66dc47b2efc999613b6210033a26.1310175992.git.dvhart@linux.intel.com>
References: <cover.1310175992.git.dvhart@linux.intel.com>
	<0c648be94c7e66dc47b2efc999613b6210033a26.1310175992.git.dvhart@linux.intel.com>
Date: Tue, 12 Jul 2011 15:06:24 +0100
Message-ID: <1310479584.20015.1058.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] bb-matrix: initial scripts to record TIME(1) metrics for BB and PM combinations
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
X-List-Received-Date: Tue, 12 Jul 2011 14:10:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 19:02 -0700, Darren Hart wrote:
> The bb-matrix.sh script will run a bitbake command, building core-image-minimal
> by default, for various combinations of BB_NUMBER_THREADS and PARALLEL_MAKE. It
> records all relevant metrics of the TIME(1) command for each combination in a
> data file.
> 
> The bb-matrix-plot.sh script can be used to visualize each of these metrics via
> a 3d surface plot, either solid surface or wireframe with a value-map
> projection on the XY plane.

Merged to master, thanks.

Richard



