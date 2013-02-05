Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2jED-0006lh-Hf
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 15:10:35 +0100
Received: from mail-yh0-f71.google.com ([209.85.213.71])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Feb 2013 05:54:38 -0800
Received: by mail-yh0-f71.google.com with SMTP id m1so78453yhg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 05:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=CZb3VfEm7/4XVmforf/rYEEFJnlJYg5txKYeIR73SYI=;
	b=d3IRUjYNVtf8lyzZ2cTxSU7cFnw4ONzxB1qAjMzk/4OwkgJWJtMwg/bRwCrWvRDn3E
	KPsMbjddsH3jyL5Tos0tVA5xigD+83aNnvqkPkV519SELxf/F53/XcjPongG00gX4iGS
	KUdFzh/ZbYOUosUeo/H0OUtznA1GRkMwszftqlfrR6t8FuaGwz0X9qsNruRngOU1iyjZ
	XKq4QEAVpBe1lN7H4lhbFr++EUzpUCc6SgUI2Sqzx53Yd5jkjOZQKZftsDRmRjAqcvI3
	DuvFTPR0WdPYo20NoNAYwEUedOsIA+o3b2EXs4B0vUQPUxh2mdJai/lG6TNFqGOi6PFH
	NcOA==
X-Received: by 10.58.206.99 with SMTP id ln3mr11375965vec.36.1360072477437;
	Tue, 05 Feb 2013 05:54:37 -0800 (PST)
X-Received: by 10.58.206.99 with SMTP id ln3mr11375956vec.36.1360072477336;
	Tue, 05 Feb 2013 05:54:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Tue, 5 Feb 2013 05:54:17 -0800 (PST)
In-Reply-To: <1360066533-20693-1-git-send-email-andrei.gherzan@windriver.com>
References: <1360066533-20693-1-git-send-email-andrei.gherzan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Feb 2013 13:54:17 +0000
Message-ID: <CAJTo0LYQAy5-RzTU4aYN0jqAX10cbMNSUPu3i+CMBFo8G4vD1w@mail.gmail.com>
To: Andrei Gherzan <andrei.gherzan@windriver.com>
X-Gm-Message-State: ALoCoQnuRXATyV+yz0hU4GOGjLGTxCxmwBbwUyDAW9qkFhqh8UBKbQvfn972w4g47HDbPIEwK+HaRBJhEpwB2gi7cujSFs00cYz5qeouJMW6lR3mE7K8EW/BEPFK8FwwJ4QUgy+JJeG/5rxgjh9MVrhghP17RQZ0Dg4YaSXX66UE2jGEdlGbzQlKHF63GVmjq0l86BwjoxKc
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant: Package systemd service in -systemd
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
X-List-Received-Date: Tue, 05 Feb 2013 14:10:36 -0000
Content-Type: text/plain; charset=UTF-8

On 5 February 2013 12:15, Andrei Gherzan <andrei.gherzan@windriver.com> wrote:
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  .../wpa-supplicant/wpa-supplicant-2.0.inc          |    6 ++++--
>  .../wpa-supplicant/wpa-supplicant_2.0.bb           |    2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

NACK.

Please don't add -systemd packages.  I've almost got a systemd.bbclass
that I'm happy with, but if you must add integration now then just
package the unit files alongside the daemons, respecting the distro
feature.

Ross


