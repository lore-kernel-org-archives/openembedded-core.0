Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id B960B6CC86
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 11:05:06 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B1C58F811ED; Wed, 20 Nov 2013 04:05:05 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id E7A56F811EB;
	Wed, 20 Nov 2013 04:05:04 -0700 (MST)
Message-ID: <528C976E.4030608@mlbassoc.com>
Date: Wed, 20 Nov 2013 04:05:18 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <528C8880.7070806@topic.nl>
In-Reply-To: <528C8880.7070806@topic.nl>
Subject: Re: tslib keeps failing on checksum
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
X-List-Received-Date: Wed, 20 Nov 2013 11:05:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-11-20 03:01, Mike Looijmans wrote:
> I get this error every time I try t build the current oe-core master:
>
> ERROR: Checksum failure fetching https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.xz;downloadfilename=tslib-1.1.tar.xz
> ERROR: Function failed: Fetcher failure for URL: 'https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.xz;downloadfilename=tslib-1.1.tar.xz'. Checksum mismatch!
> File: '/home/mike/zynq-next/build/downloads/tslib-1.1.tar.xz' has md5 checksum d41d8cd98f00b204e9800998ecf8427e when 14771f8607b341bb4b297819d37e837d was expected
>
> Now the weird thing is, that when I fetch the thing using wget, I get a blob with the right checksum:
>
> # wget https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.xz
> # md5sum tslib-1.1.tar.xz
> 14771f8607b341bb4b297819d37e837d  tslib-1.1.tar.xz
>
> Is oe-core using some other flavour of wget or what else could cause this kind of fetch error?
>

What version of OE-core metadata are you using?  The recipe
   meta/recipes-graphics/tslib/tslib_1.1.bb
in OE-core rev 2d8e124adcf27af524eeeae61daf1b21a1c2f27c has
the correct md5sum, so you must have incorrect/stale recipe.

The recipe was last updated in this rev:
commit 2e92d845b433f3a1805c310ccda54cfc7dd8b1e1
Author: Paul Eggleton <paul.eggleton@linux.intel.com>
Date:   Fri Aug 16 14:33:12 2013 +0100

     tslib: update to 1.1

     Drop patches merged upstream. 32bitBE-support.patch wasn't merged, but
     no longer applies and similar changes look to have been made; tslib 1.1
     works properly on qemumips without it, so this has also been dropped.

     Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
     Signed-off-by: Saul Wold <sgw@linux.intel.com>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

