Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TfX0D-0002ND-QU
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 15:28:12 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 03 Dec 2012 06:13:46 -0800
Received: by mail-ia0-f197.google.com with SMTP id x26so4180405iak.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 06:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Kat/lzKT952UUD0ZiXSU1BV9nUAdmMfgSzoKiIskubQ=;
	b=JTVS9y8AQ8zu57CS5aPBqWVwTR42zFok17N6KVumFXyoszLH40IgLKMJtByIYW/AAu
	XZ6taWdKcQVQgIZJAyxS4G5yvseLG8ydpgXiHjniX9zJ+e67CEFIioDNYALOY+Tyupam
	fV0Gw8rVdN+UFFUfqbkC4mJensJcfNxGepm1V0NeFAilNhEMx7/G6dtilhYNIo3u9rzN
	MydZgAiiDSqX/olKvsPcFjG/zJYggccQ9krZM1csVAtJ7YgfEo37X3nyN6Ymt56VG7cq
	8knKV7WrWVCILP/oLhCySUbSgCWWNtYyxQMNpT+hQQy/WLObwzOUnZEkrwvXD811I5FM
	hFWA==
Received: by 10.60.1.169 with SMTP id 9mr8116971oen.93.1354544024992;
	Mon, 03 Dec 2012 06:13:44 -0800 (PST)
Received: by 10.60.1.169 with SMTP id 9mr8116964oen.93.1354544024924; Mon, 03
	Dec 2012 06:13:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Mon, 3 Dec 2012 06:13:24 -0800 (PST)
In-Reply-To: <50B93620.6050203@intel.com>
References: <1353996801-28402-1-git-send-email-li.wang@windriver.com>
	<50B93620.6050203@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Dec 2012 14:13:24 +0000
Message-ID: <CAJTo0LY0WG_QNWT-aPW1jSnz9Ox8sHLfDQUs6KbXCEgF7zgo0g@mail.gmail.com>
To: Scott Garman <scott.a.garman@intel.com>, li.wang@windriver.com
X-Gm-Message-State: ALoCoQlmJlwA5yPxYEwrJf+EixhJDMkEq4m37XurRSvJGHXRy262i2yiGc8RIME8yCGdHlf7o47qzCUnflwNfDt8eZZX5YU4/ijOlW047rR6adA6rycW/ckYDeMRvsqZ38LpjjTU5An/inoDnZJ6TvxT8NL9Yfe7QBhwrz/DQ2hZ1rpe1YsEn07H88cLuqrIy8Eeacwd7MP6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: CVE-2011-4327
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
X-List-Received-Date: Mon, 03 Dec 2012 14:28:12 -0000
Content-Type: text/plain; charset=UTF-8

On 30 November 2012 22:41, Scott Garman <scott.a.garman@intel.com> wrote:
> The second link you referenced above explains that the vulnerability exists
> in versions prior to openssh 5.8p2, and yet your patch was submitted against
> openssh 6.0p1. So it seems that this would not apply. Or am I
> misunderstanding the nature of the bug?

Prior to 5.8p2 *and* not Linux:

2. Affected configurations

        Portable OpenSSH prior to version 5.8p2 only on platforms
        that are configured to use ssh-rand-helper for entropy
        collection.

        ssh-rand-helper is enabled at configure time when it is
        detected that OpenSSL does not have a built-in source of
        randomness, and only used at runtime if this condition
        remains. Platforms that support /dev/random or otherwise
        configure OpenSSL with a random number provider are not
        vulnerable.

        In particular, *BSD, OS X, Cygwin and Linux are not
        affected.

Ross


