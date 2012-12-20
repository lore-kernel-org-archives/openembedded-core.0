Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tlhbm-0004I6-Ma
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 16:00:31 +0100
Received: from mail-qa0-f70.google.com ([209.85.216.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 06:45:41 -0800
Received: by mail-qa0-f70.google.com with SMTP id hg5so6182595qab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 06:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=BSK9Xtxco9FeadySjJlN4LjCeDDBtFJuTOBmHXTEgdk=;
	b=isRE2G3bBsK+p69ekVvtozOEZMLjZbZCwF5Wao0IKBJ8vqkKF1gkSD9+/pz3V7fm44
	5xPY6/8Fe7D7C9kId3bRc8D7XZ8A9g8PuNGsTgMpWS15jJma5xs8XDXQ9BeYneFpP/Qe
	Fv7LWHHu2kST8a3NKBWL8Q8QZo4AxcbM05xl/7m9TfJMvJZE0pbouVAe32z9NC3wk6tx
	PKVHUa3c1AOaeFngDbQU2UvEpjOeuZVUkurs7LWV+d/6ifDwfGlaLJQvLDTpz6wSYm5G
	vo/vHjrZCfkoKezFRXfLmgKQ7U1ea1Gnwp1nI6gSlJmUlqKDjF7AzaLqi0U0cQXMpov3
	E+Xg==
X-Received: by 10.52.75.105 with SMTP id b9mr12932857vdw.28.1356014740378;
	Thu, 20 Dec 2012 06:45:40 -0800 (PST)
Received: by 10.52.75.105 with SMTP id b9mr12932844vdw.28.1356014740275; Thu,
	20 Dec 2012 06:45:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 06:45:20 -0800 (PST)
In-Reply-To: <1356009340-15874-2-git-send-email-laurentiu.palcu@intel.com>
References: <1356009340-15874-1-git-send-email-laurentiu.palcu@intel.com>
	<1356009340-15874-2-git-send-email-laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 14:45:20 +0000
Message-ID: <CAJTo0LbMxNc4JJMw+F+sUnsQAWiBorty_Tfbyw+ZWuU0UPVg0Q@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQl+2gGV5ttTDFe718Y1TUfg/87xEHAKVipi+zmACAhyOETJGhMhgB7pY79qTvMBaLD48oQ6RwTNBJ8bp268qQLy6XV7WH7BScVl0qEJOVgPGdGyUPDn2It0lMTQYzyENiRS6a7kZqPNkWZYX5OVzvEFIRKGtBACcIw/f19ArXbgWfGUhv1Z0ymaS10hwXz8K1MyxGwn
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] qemu.bbclass: add qemu_run_binary() function
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
X-List-Received-Date: Thu, 20 Dec 2012 15:00:37 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 13:15, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> dynamic_loader = rootfs_path + '$(readelf -l ' + rootfs_path + \
>       binary + '| grep "Requesting program interpreter"|sed -e \'s/^.*\[.*: \(.*\)\]/\\1/\')'

Would it be easier to do the string manipulation in python?  Spawning
grep and sed when Python can do string manipulation seems excessive.

Nice addition to the class though.

Ross


