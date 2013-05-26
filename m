Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id B38D3608F7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 07:39:45 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id bg2so5799318pad.39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 00:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=uoRvvLVOMvMThtjHt4280QAv+2WjuGjjBkKno4o2yzM=;
	b=YyREsvUj62pjmLg9M8sd5FT+518eetndcOO5BpAEUafT9N+yi7AXF5hrVE3BRqxUEr
	oQFgLE3tToP3HLvbgviWCHIFH0yFlmRO9MdBj++ffOk8fLXr0H4U/5v1O71dT4FW3f+8
	KMMYHczez0fnrzTXwMq5oi7MsTiiWAAJodNzrnyt2nthQPPwjqtUkjtCEyoRZBCydpmN
	zptZ17PZ5GHbkX/gILcPOFIOJYS17SzspXcunDD+5w7d5/pHrUWMRYPghrFHrh6VE2KJ
	cdjrq9eCkHfADkQy/rnI8WSyjkXoF+WsfvaSH6jMjDxFYCj9pkL6cKm3NPXn2Amv6hqk
	ZZtg==
X-Received: by 10.66.231.7 with SMTP id tc7mr24824106pac.143.1369553986650;
	Sun, 26 May 2013 00:39:46 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id l4sm23528712pbo.6.2013.05.26.00.39.44
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 00:39:45 -0700 (PDT)
Message-ID: <51A1BB1F.20102@gmail.com>
Date: Sun, 26 May 2013 17:34:55 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1369554058-11484-1-git-send-email-net147@gmail.com>
In-Reply-To: <1369554058-11484-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5] resolvconf: remove /var/volatile/run/resolvconf/interface from package
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
X-List-Received-Date: Sun, 26 May 2013 07:39:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/05/2013 5:40 PM, Jonathan Liu wrote:
> - Remove /etc/resolvconf/run/interface from package as it actually uses
> /etc/resolvconf/run/interface
> - Create /var/run/resolvconf/interface on startup using
> populate-volatiles.sh and tmpfiles.d for systemd
> - Create symbolic link from /etc/resolvconf/run to /var/run/resolvconf
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   .../resolvconf/resolvconf_1.72.bb                  | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
I tested this with sysvinit and systemd using opkg feed to install under 
core-image-base/qemux86.
/var/run/resolvconf/interface is created after install and also after 
reboot.
Running "resolvconf -a eth0" doesn't return error when checking if 
/etc/resolvconf/run/interface exists.

Regards,
Jonathan

