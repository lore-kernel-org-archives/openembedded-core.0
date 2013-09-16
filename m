Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id EC657605F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 22:21:53 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 93EA7F811E1; Mon, 16 Sep 2013 16:21:55 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id DAD6EF811DD;
	Mon, 16 Sep 2013 16:21:54 -0600 (MDT)
Message-ID: <523784BB.8080404@mlbassoc.com>
Date: Mon, 16 Sep 2013 16:22:51 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Tim Biernat <biernat@ieee.org>
References: <CAH2s=tsyyTMO9KoJMfP0SS4x0vMLphYuDWhPEv0eWeui3CjJ1w@mail.gmail.com>
In-Reply-To: <CAH2s=tsyyTMO9KoJMfP0SS4x0vMLphYuDWhPEv0eWeui3CjJ1w@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Sep 2013 22:21:54 -0000
X-Groupsio-MsgNum: 45106
Content-Type: multipart/mixed; boundary="------------070802010305090801090501"

--------------070802010305090801090501
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-09-16 16:09, Tim Biernat wrote:
> Just wondering if you got this working? I am trying to build gstreamer with h.264 support on Intel n450 for some time now without success.

Firstly, since this message was on a public email list, it's polite
to keep the discussion there so that everyone benefits.

Also, not quoting any of the previous message makes it very difficult
to follow up - you can't imagine how many emails I've written since
that one which was a month ago...

I did indeed get it working by using the attached .bbappend file.
Actually pretty simple, I hope that the documentation on PACKAGECONFIG
catches up soon.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------070802010305090801090501
Content-Type: text/plain; charset=UTF-8;
 name="gst-plugins-ugly_0.10.19.bbappend"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="gst-plugins-ugly_0.10.19.bbappend"

IwojIEFkanVzdCBkZXNpcmVkIHBsdWdpbnMgd2hpY2ggYXJlIG5vdCBpbiBQb2t5L1lvY3RvIGJl
Y2F1c2Ugb2YgbGljZW5zaW5nIHJlcXVpcmVtZW50cwojCgpERVBFTkRTICs9ICIgeDI2NCAiClBB
Q0tBR0VDT05GSUcgKz0gIngyNjQiCg==

--------------070802010305090801090501--
