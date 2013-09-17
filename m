Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 339AE60F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 10:58:15 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 34063F8120E; Tue, 17 Sep 2013 04:58:17 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4310EF811DB;
	Tue, 17 Sep 2013 04:58:16 -0600 (MDT)
Message-ID: <52383601.9040308@mlbassoc.com>
Date: Tue, 17 Sep 2013 04:59:13 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <CAH2s=tsyyTMO9KoJMfP0SS4x0vMLphYuDWhPEv0eWeui3CjJ1w@mail.gmail.com>
	<523784BB.8080404@mlbassoc.com>
	<CAJTo0LbhQkrrMYLrXJSpPR4MzYx6zYtSBxOVFhAivqH+O96hHA@mail.gmail.com>
In-Reply-To: <CAJTo0LbhQkrrMYLrXJSpPR4MzYx6zYtSBxOVFhAivqH+O96hHA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: re. Enabling x264 support in gstreamer
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
X-List-Received-Date: Tue, 17 Sep 2013 10:58:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-09-16 16:32, Burton, Ross wrote:
> On 16 September 2013 23:22, Gary Thomas <gary@mlbassoc.com> wrote:
>> I did indeed get it working by using the attached .bbappend file.
>> Actually pretty simple, I hope that the documentation on PACKAGECONFIG
>> catches up soon.
>
> You don't need the DEPENDS line, the x264 stana specifies that for you.

Thanks, I missed that.

>
> I presume you're refering to something like a worked example of how to
> use PACKAGECONFIG instead of just a reference?  You should file a bug
> about that - there's a never-ending amount for Scott to document so
> pointers for obvious gaps are always welcomed.

Done - bug #5214

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

