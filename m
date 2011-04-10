Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q8kHH-0003nl-HO
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 04:21:27 +0200
Received: by pwj9 with SMTP id 9so1734443pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Apr 2011 19:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=puiBmYznkNTHVUDpNPAqImMFOyzvl/wbjrSeFZgUuTM=;
	b=E2BHM9WdjvbLvZP7IvMxLm55UHD9azK6AH9Dhp4g6PbYwafBYxTjBVKxjHHlowoBC+
	4mt2gAFCEcCnW9m2mkwFgOhBV7iXHgyS26hfbW/BLoD5vtRED8r6xGmUpMygX1RZX/tE
	KqKNSb+UgSc9+5HnzXPWgRf5sejoc7FQXiiYc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=e1S71maOqTiaM7bfkOiJ86EjnqLY3CZ56xTYE4+E5f3SY180f+BkbuRz8py073HuU5
	SkxmAzxhFv7qsvt2+pfqi81gQbuf46p7vRtzQ84kGIJv73j3wYPnoMNUxTLDqYTrCOOS
	iU7ev9InzbiAB8AmreFsRNpURi10xW4obhKog=
Received: by 10.142.194.3 with SMTP id r3mr3399033wff.352.1302401955470;
	Sat, 09 Apr 2011 19:19:15 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x11sm6003744wfd.13.2011.04.09.19.19.13
	(version=SSLv3 cipher=OTHER); Sat, 09 Apr 2011 19:19:14 -0700 (PDT)
Message-ID: <4DA113A2.8070705@gmail.com>
Date: Sat, 09 Apr 2011 19:19:14 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1302034944.git.chris_larson@mentor.com>
In-Reply-To: <cover.1302034944.git.chris_larson@mentor.com>
Subject: Re: [PATCH 0/3][v2] Rework the devshell
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
X-List-Received-Date: Sun, 10 Apr 2011 02:21:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 4/5/2011 1:30 PM, Chris Larson wrote:
> From: Chris Larson<chris_larson@mentor.com>
>
> - Adds a utility metaclass for maintaining class registries
> - Shifts the handling of spawning a terminal into a new 'terminal' python
>   module
> - Automatically selects an appropriate terminal based on what you have
>   available on your machine
> - Still allows manual selection, but in a more convenient way, and falls back
>   to auto if you select an invalid or unavailable (not installed) terminal
> - Improves how we spawn screen:
>
>   - Shows a warning when spawning it, so do_devshell doesn't appear to hang
>   - Spawns a named screen session 'devshell', to avoid confusion when the user
>     already has other screen sessions running
>


works nicely. I usually use screen and it helped

> Pull URL: https://github.com/kergoth/oe-core
>    Branch: devshell
>    Browse: https://github.com/kergoth/oe-core/commits/devshell
>
> Thanks,
>      Chris Larson<chris_larson@mentor.com>
> ---
>
>
> Chris Larson (3):
>    oe.classutils: add module
>    Rework how the devshell functions
>    oe.terminal: improve how we spawn screen
>
>   meta/classes/devshell.bbclass |   26 ++++-------
>   meta/classes/terminal.bbclass |   30 +++++++++++
>   meta/lib/oe/classutils.py     |   45 +++++++++++++++++
>   meta/lib/oe/terminal.py       |  107 +++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 191 insertions(+), 17 deletions(-)
>   create mode 100644 meta/classes/terminal.bbclass
>   create mode 100644 meta/lib/oe/classutils.py
>   create mode 100644 meta/lib/oe/terminal.py
>



