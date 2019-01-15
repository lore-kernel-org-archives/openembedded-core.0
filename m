Return-Path: <seebs@seebs.net>
X-Greylist: delayed 612 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Jan 2019 14:56:13 UTC
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id F2C956BE2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:56:13 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 594612E8960;
	Tue, 15 Jan 2019 08:46:02 -0600 (CST)
Date: Tue, 15 Jan 2019 08:45:58 -0600
From: Seebs <seebs@seebs.net>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20190115084558.02e8f82f@seebsdell>
In-Reply-To: <20190115123113.23071-1-stefan@agner.ch>
References: <20190115123113.23071-1-stefan@agner.ch>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Handle OFD lock flags
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
X-List-Received-Date: Tue, 15 Jan 2019 14:56:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Jan 2019 13:31:13 +0100
Stefan Agner <stefan@agner.ch> wrote:

> +	case F_OFD_GETLK:
> +	case F_OFD_SETLK:
> +	case F_OFD_SETLKW:

These probably need an #ifdef for systems that don't have those names
yet, but otherwise this looks reasonable?

-s

