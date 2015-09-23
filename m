Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id ABE157404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 12:24:37 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BD965F81199; Wed, 23 Sep 2015 06:24:37 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 878BDF81199;
	Wed, 23 Sep 2015 06:24:36 -0600 (MDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <560173B5.1000408@mlbassoc.com>
	<CAJTo0Lam+s3YjVaxXZQZBbYY9y+_oMtJ46_dWMHcDRmMAqdu=w@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56029A05.7000607@mlbassoc.com>
Date: Wed, 23 Sep 2015 06:24:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lam+s3YjVaxXZQZBbYY9y+_oMtJ46_dWMHcDRmMAqdu=w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Error building gdk-pixbuf-native
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
X-List-Received-Date: Wed, 23 Sep 2015 12:24:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-23 06:15, Burton, Ross wrote:
>
> On 22 September 2015 at 16:28, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     | g_module_open() failed for /home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-svg.so: libharfbuzz.so.0: cannot open
>     shared object file: No such file or directory
>
>
> Here's my guess at what happened.  Starting state was a complete sysroot with at least gdk-pixbuf, harfbuzz, librsvg installed.  Yhen you did a new build.  At least harfbuzz and
> gdk-pixbuf were being rebuilt, so purged from the sysroot.  gdk-pixbuf rebuilt, installed into sysroot, ran the update-cache script which then found the rsvg loader from the
> previous sysroot that was not (yet?) removed that links to harfbuzz.  Harfbuzz still isn't reinstall yet, linkage fails.
>
> Is this with master or a release? There are changes in master compared to fido to improve situations like this.

Master updated 2015-09-22 (7b86c771c80d0759c2ca0e57c46c4c966f89c49e)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

