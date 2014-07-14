Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-07.prod.phx3.secureserver.net
	(p3plsmtpa07-07.prod.phx3.secureserver.net [173.201.192.236])
	by mail.openembedded.org (Postfix) with ESMTP id 988A8703EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:33:06 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-07.prod.phx3.secureserver.net with 
	id SFZ61o0061mTNtu01FZ60V; Mon, 14 Jul 2014 08:33:07 -0700
Message-ID: <53C3F832.8010307@pabigot.com>
Date: Mon, 14 Jul 2014 10:33:06 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1405132947-32495-1-git-send-email-pab@pabigot.com>
	<CAJTo0LbzhpJb_CMkqRy6etVJnah0HACkP8k_8mKw3A+8s5kkwg@mail.gmail.com>
In-Reply-To: <CAJTo0LbzhpJb_CMkqRy6etVJnah0HACkP8k_8mKw3A+8s5kkwg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cups: extend cups-no-gcrypt.patch to apply to configure script
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
X-List-Received-Date: Mon, 14 Jul 2014 15:33:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/14/2014 09:37 AM, Burton, Ross wrote:
> On 12 July 2014 03:42, Peter A. Bigot <pab@pabigot.com> wrote:
>> The original patch removed gcrypt from an m4 source file that
>> contributes to configure.in, but didn't apply those changes to or
>> rebuild the configure script itself.  This allowed libgcrypt-config to
>> be found, adding native libraries to the target build.
> I'm really not happy with maintaining patches to generated files, do
> you know why we don't use the usual autotools class to re-generate the
> configure script at build time?

No; it was that way when I found it, and I'm still too rusty on yocto to 
do it the right way.  If you can point me to a recipe that does this 
I'll try to rework it (and resubmit based on openembedded-core instead 
of poky).

(FWIW: The issue doesn't show up building cups; it shows up with 
core-image-lsb building ghostscript which believes cups-config's lie 
that it needs -L/lib/x86_64-linux-gnu to find the gcrypt libraries that 
it doesn't reference.)

Peter

