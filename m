Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA527F822
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 23:25:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47PrG46ylMz23;
	Sat, 30 Nov 2019 00:25:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575069917;
	bh=AhQ4RlVp+VKLmlpCSrpA0G7JVQxzJGOUpivHT0d9aYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYwXYTZdoQsMKRMnt92ip65bhVb7BBARZcVIr/kvOZW6Xc1C4aGfLK1z3dsWSCIrp
	DCV2kxwGfcwdWBjXWOURY1tz+hcyetTgjuYcJcZU+PLtfdg9gcKNzJKtkuGrcC7WTW
	6a2ZcmQb0QI2wx/0L0AwEASWe3W+0i5+pk/P5kaTgpXRnVIUxc9rzqaEgqTXT5PP0J
	msBtr/7gC9wu2REuBr7FOoE+RWcJMzAJMBlhSRyG2seiG3c3vHe/LnNzejQ31yr2tX
	+Hyj4yYmBPBGVh7CiNoQMVGYRqLVSdzA5OUvVD3t5VRulKXdB6nClJq8FKg7+DGEFN
	Cr8qAvfLHijB+GyDD98SynVfE9v3bnNXIqRwPity/gQbWsLEFFdGsjnbsFvcF9l9BL
	beKyr3orP4x4fW5mZMNtMF+1ZmqVU5PoVnisvDLuewK+JTGuTp+IMPCW8o8vrTqjYV
	FA9KAMAidNBMI84ivUGHxE2hKCb4C3RIs1UVSP4NE2V8ZMerwP0q6b/AHWElzcc1Pq
	gO7XCkfsm49mTFXcK+PqtrMsFEhOVsEOlPx+S2uM8KDAeIWcrNerJ2RbrS7wXWZTxM
	uk89a/fOFyhZ85IzPCChMFiHwvnIgbhimzG8b2N8c6cQq+RjT1GB37oUJMUS89qFyI
	KBVMpxQnOmsT+U44VHTAU9+E=
Date: Sat, 30 Nov 2019 01:25:14 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191129232514.GA19686@localhost>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-15-alex.kanavin@gmail.com>
	<54364ceb-4a85-8912-134b-8880eecccabb@intel.com>
	<ce46910c-b481-f7a8-9f41-b8a4a745644f@intel.com>
MIME-Version: 1.0
In-Reply-To: <ce46910c-b481-f7a8-9f41-b8a4a745644f@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/15] python3: update to 3.8.0
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
X-List-Received-Date: Fri, 29 Nov 2019 23:25:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 29, 2019 at 10:55:23PM +0000, Ross Burton wrote:
> On 29/11/2019 22:54, Ross Burton wrote:
> > Not sure what is going on but with this when btrfs-tools is rebuild:
> > 
> > packages/corei7-64-poky-linux/btrfs-tools/btrfs-tools: FILELIST:
> > directory renamed
> > /usr/lib/python3.7/site-packages/btrfsutil-1.1.1-py3.7.egg-info ->
> > /usr/lib/python3.8/site-packages/btrfsutil-1.1.1-py3.8.egg-info, removed "/usr/lib/python3.7/site-packages/btrfsutil.cpython-37m-x86_64-linux-gnu.so",
> > added
> > "/usr/lib/python3.8/site-packages/btrfsutil.cpython-38-x86_64-linux-gnu.so"
> > 
> > Basically, all the 3.7 references are now 3.8.  That's fine.
> > 
> > packages/corei7-64-poky-linux/btrfs-tools/btrfs-tools: RDEPENDS: removed
> > "libpython3 (['>= 3.7.5'])"
> > 
> > Python 3.7 is removed but no Python 3.8 added. Weird!
> 
> Same happened to gpgme:
> 
> packages/corei7-64-poky-linux/gpgme/python3-gpg: RDEPENDS: removed
> "libpython3 (['>= 3.7.5'])"

That's expected, C extensions are no longer linked with libpython by default.


> Ross

cu
Adrian

