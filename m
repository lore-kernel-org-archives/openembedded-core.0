Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Te5G4-0001jX-Jm
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 15:38:32 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1AD16F811FE; Thu, 29 Nov 2012 07:24:18 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 0CF44F811FD;
	Thu, 29 Nov 2012 07:24:17 -0700 (MST)
Message-ID: <50B7703C.3090507@mlbassoc.com>
Date: Thu, 29 Nov 2012 07:25:00 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <50B76322.6000101@mlbassoc.com>
	<CAJTo0LaVBOHMipWo=E_=T8mCTMRzB8THg6Ukgt+hDTK2PgvDWA@mail.gmail.com>
In-Reply-To: <CAJTo0LaVBOHMipWo=E_=T8mCTMRzB8THg6Ukgt+hDTK2PgvDWA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Where's my X cursor?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 14:38:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-11-29 06:39, Burton, Ross wrote:
> On 29 November 2012 13:29, Gary Thomas <gary@mlbassoc.com> wrote:
>> I'm having troubles with the latest Xorg server.  I have a system
>> which has a small display (320x240) with a touch screen.  When I
>> bring up X, there is no mouse pointer, even if my touch screen is
>> disabled [in the kernel] and I have a "normal" (USB) mouse attached.
>
> Your machine configuration (/etc/formfactor/machconfig) probably says
> HAVE_TOUCHSCREEN=1, which results in the X init scripts disabling the
> cursor.  Remove that line, comment it out with a #, or set it to 0,
> and the cursor should be visible on the next boot.

Duh, I should have thought of that. What program/script uses that file?
I ask because the code in /etc/X11/Xserver explicitly does not if the
server is Xorg (if I'm reading things correctly).

Also, any pointers on how to debug the touch screen?  As I said, it
works fine with SDL and Qt, but with X, it seems to go 100% backwards
from what I want, i.e. touch left moves the cursor right, etc.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


