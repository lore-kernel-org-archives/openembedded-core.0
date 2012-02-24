Received: from bluegiga.fi ([194.100.31.45] helo=darkblue.bluegiga.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lauri.Hintsala@bluegiga.com>) id 1S0pMt-0001nO-03
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 08:15:03 +0100
Received: from [10.1.1.28] ([10.1.1.28]) by darkblue.bluegiga.com with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 24 Feb 2012 09:06:42 +0200
Message-ID: <4F473702.7020909@bluegiga.com>
Date: Fri, 24 Feb 2012 09:06:42 +0200
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.24) Gecko/20111108 Lightning/1.0b2 Thunderbird/3.1.16
MIME-Version: 1.0
To: Gary Thomas <gary@mlbassoc.com>
References: <1328890565-8304-1-git-send-email-gary@mlbassoc.com>
In-Reply-To: <1328890565-8304-1-git-send-email-gary@mlbassoc.com>
X-OriginalArrivalTime: 24 Feb 2012 07:06:42.0308 (UTC)
	FILETIME=[DC742C40:01CCF2C2]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: Make /etc/timestamp consistent again.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 07:15:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2012 06:16 PM, Gary Thomas wrote:
> Commit cc8695 changed the way timestamps were handled
> and added some extra munging to be able to compare them
> reliably.  This change makes the timestamp value the same
> everywhere and simplifies how the check to set the system
> clock based on the timestamp is done.
>
> Also, if the value stored in /etc/timestamp is newer
> [at all] than the current system time, set the system clock
> from the stored value, down to the minute, not just the day.
>
> Signed-off-by: Gary Thomas<gary@mlbassoc.com>
> ---
>   .../initscripts/initscripts-1.0/bootmisc.sh        |    4 ++--
>   .../initscripts/initscripts-1.0/save-rtc.sh        |    2 +-
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)


Hi Gary,

You should do the same changes to meta/classes/image.bbclass where the 
/etc/timestamp file is generated to filesystem image.

Regards,
Lauri Hintsala


