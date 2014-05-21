Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 725DF6AE3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 23:08:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4LN8gh8023510
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 May 2014 16:08:42 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 21 May 2014 16:08:41 -0700
Date: Wed, 21 May 2014 18:08:21 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140521180821.48432cd8@e6410-2>
In-Reply-To: <CAJTo0LaCDvJeZdPnQ+Tjr=nxRsiEdD1ajfgGWf9gOFv_dm25LA@mail.gmail.com>
References: <cover.1400277127.git.peter.seebach@windriver.com>
	<3e32cfa9c91fb088c91cf3ef9db200d848a4ed07.1400277127.git.peter.seebach@windriver.com>
	<537CC2C6.1040503@linux.intel.com>
	<20140521135823.09df4ad0@e6410-2>
	<CAJTo0LaCDvJeZdPnQ+Tjr=nxRsiEdD1ajfgGWf9gOFv_dm25LA@mail.gmail.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo: handle fchmodat better, mask out unwanted write bits
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
X-List-Received-Date: Wed, 21 May 2014 23:08:42 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 21 May 2014 20:00:51 +0100
"Burton, Ross" <ross.burton@intel.com> wrote:

> Basically, Upstream-Status: Backport [original sha here]

Ahh, thanks. I have attempted to send a fixed pull request. (I don't actually
have time to do anything yet, but my code's compiling.)

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

