Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id CE5EE6A8B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 17:17:24 +0000 (UTC)
Received: from [192.168.178.101] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id CE852205A3;
	Thu,  6 Jun 2013 19:17:24 +0200 (CEST)
Message-ID: <51B0C431.3040505@pseudoterminal.org>
Date: Thu, 06 Jun 2013 19:17:37 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1370027758-22849-1-git-send-email-dv@pseudoterminal.org>
	<51B0BE87.8010807@linux.intel.com>
In-Reply-To: <51B0BE87.8010807@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] GStreamer 1.0 recipes
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
X-List-Received-Date: Thu, 06 Jun 2013 17:17:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.2013 18:53, Saul Wold wrote:
> On 05/31/2013 12:15 PM, Carlos Rafael Giani wrote:
>> These patches introduce recipes for GStreamer 1.0 . They
>> are copied over from my gstreamer 1.0 layer at
>> https://github.com/dv1/meta-gstreamer1.0 . All files except
>> gstreamer1.0-plugins-package.inc were copied; gst-plugins-package.inc
>> was patched to fix a problem with -meta packages and can be used for
>> both 0.10 and 1.0 now (the only difference is the value of the LIBV
>> variable).
>>
> So is there an update path from 0.10 to 1.0?  Also normally we replace 
> the older version with the newer version by "git mv" in order to 
> preserve history where possible.  I am not sure if you can do this 
> with a move and then copy the new versions in.
>
> Since the packages are renamed, and I don's see any 
> RPROVIDES/RREPLACES or RCONFLICTS to cover the upgrade path.
>

Replace? Why do you want to replace? 1.0 is designed to be able to 
coexist with 1.0 in the same rootfs (you cannot use both at the same 
time in a process; however, this isn't a concern for OE, but for 
application developers). In essence, simply adding the new files from 
the patch to recipes-multimedia/gstreamer/ should be sufficient. The old 
0.10 ones can be left unchanged.

