Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UbpG2-0008FR-Te
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:41:28 +0200
Received: by mail-ve0-f179.google.com with SMTP id oz11so5464612veb.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:references:from:mime-version:in-reply-to:date:message-id
	:subject:to:cc:content-type;
	bh=7OcXFWLxuIAegBppCrvAsddxyHJJ7nJaN+2brb84h+s=;
	b=aLgxCWPXg8679elSQTPi69ijW6HJWc5/xwSZF/Zh5Uw10cIsLBIEJ6Nh059DVMmlbf
	zkT5ce7zyovjL4zKqJtACG2FGoVv0qsco12y3at4UIUA6ymVFzAeAzpZ0XN7pmBtJ6Zl
	Wk5DI7N/cxdH9odXEwfGeFzf/rgtKQahmCq8WiEgJLGbyM6WE0ylceF00sEbAOnSgdo2
	PLh2Ga7dcZ0RXc3wnPO8zpqveOwNxrq083RxiqzOB3UXLsg1aVIn4U5nTk1CDVljsZnz
	4qF9rThNrLJvp65o1B+Kh7sUKHRSdNrEffTHJRPNl5O+VooQQLXbJoFQS+XaNGyRkVxb
	xqIA==
X-Received: by 10.52.17.102 with SMTP id n6mr15428967vdd.109.1368436996800;
	Mon, 13 May 2013 02:23:16 -0700 (PDT)
References: <1368413938-7757-1-git-send-email-net147@gmail.com>
	<CAJTo0LaFExB-DxJCJ-Sranagpbxc56sT9ahBwgtBLH0PVq3_9g@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <CAJTo0LaFExB-DxJCJ-Sranagpbxc56sT9ahBwgtBLH0PVq3_9g@mail.gmail.com>
Date: Mon, 13 May 2013 19:23:14 +1000
Message-ID: <-7685674658700664845@unknownmsgid>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] connman: add iptables to RDEPENDS
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
X-List-Received-Date: Mon, 13 May 2013 09:41:34 -0000
Content-Type: text/plain; charset=UTF-8

I did a git pull which updated connman to 1.13 and rebuilt image from
scratch clearing all temp files and work. The iptables dependency was
missing when I checked with opkg-cl on the target.

Regards,
Jonathan

On 13/05/2013, at 7:05 PM, "Burton, Ross" <ross.burton@intel.com> wrote:

> On 13 May 2013 03:58, Jonathan Liu <net147@gmail.com> wrote:
>> The connmand daemon requires libxtables.so from iptables to start up.
>
> And the automatic dependencies-from-linkage code seems to be working just fine:
>
> $ dpkg -I connman_1.13-r20.0.2_core2.ipk
> ...
> Depends: iptables (>= 1.4.17), dbus-1, ofono, libdbus-1-3 (>= 1.6.8),
> bluez4, libgnutls26 (>= 2.12.21), libc6 (>= 2.17), libglib-2.0-0 (>=
> 2.36.0), shadow, base-passwd, wpa-supplicant
>
> So the question is can you verify that this dependency isn't happening
> for you, and how do we fix *that* problem.
>
> Ross


