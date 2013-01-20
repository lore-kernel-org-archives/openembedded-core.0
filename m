Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tx1dc-00083D-Jo
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 21:37:13 +0100
Received: from mail-vc0-f199.google.com ([209.85.220.199])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Jan 2013 12:20:32 -0800
Received: by mail-vc0-f199.google.com with SMTP id fo13so845479vcb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2013 12:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=sgisb9EgjAl5/2YxCb1y83+BAOBXi6uy6KudMRPLC5o=;
	b=LjI9CwhoLH7KsK9QW8vAWyQb3dEHRhrZnWi8+PtZ0OYlHPBjaIGAtaro/5SzsbfGYk
	9nYMEAs4lPWxw3SCdT1aOLjFRfu4NcN8xruvA1MRZExeXfaP08ar17pI4jqNhdyGHCse
	CMA7Lk+md7SnIMyeeEpvaOmXhK9waGBETdpqJaeiGYnFBEx1Mu7nDNEszZSLBbZXn4Ma
	0+4XVGkY1X8DQXSR3kY4gJXdP8nap1jRoE3ikoW6Me3S7nvwIc79+UD34yR9f14FmBzf
	lMBK/U48NvUR0tCZ1TfrnTa+Yt+b1vcuXg614/2ExltA/F00Omi75rvOGAiHvtBsyaUO
	tBGw==
X-Received: by 10.52.35.20 with SMTP id d20mr15043373vdj.50.1358713299027;
	Sun, 20 Jan 2013 12:21:39 -0800 (PST)
X-Received: by 10.52.35.20 with SMTP id d20mr15043370vdj.50.1358713298914;
	Sun, 20 Jan 2013 12:21:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Sun, 20 Jan 2013 12:21:18 -0800 (PST)
In-Reply-To: <50FC3899.5000202@linux.intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<50FC3899.5000202@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 20 Jan 2013 20:21:18 +0000
Message-ID: <CAJTo0LaL3vCw52_h-Ab3J9oBHwZwxn_WjUj3D8iivundKypfHQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkH8WpsfSTfnqAfW/FPfBI2rM2YpVBi26a9fTRzHQOzqvIbhTejdQc0hR2Ue6iPlPbnU+sz0S7xlJ3bjT0Uc9PKyu3IfkFRFOmo/Y6LBM+4+bS8nzrsk8Vm4HHYfs+PstOyBEqOyo6F4Oye8y/QyiV/ZwCnCzWAVYiUJhSxbmjm+vGEJ937zm2PFFAcemGFkM4E2ijM
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Sun, 20 Jan 2013 20:37:14 -0000
Content-Type: text/plain; charset=UTF-8

On 20 January 2013 18:34, Saul Wold <sgw@linux.intel.com> wrote:
> This change introduced a new warning about un-packaged files:
>
>> WARNING: QA Issue: connman: Files/directories were installed but not
>> shipped
>>   /lib
>>   /lib/systemd
>>   /lib/systemd/system
>>   /lib/systemd/system/connman.service

That will be connman detecting the systemd pkgconfig files in the
sysroot and enabling the integration automatically.  To avoid either
a) enabling systemd integration in every service that does this or b)
disabling systemd in every service that does this, can we ignore these
warnings knowing that they'll be resolved when the rest of the
integration lands?

Ross


