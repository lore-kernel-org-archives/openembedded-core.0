Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsBln-0001hJ-MN
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:25:36 +0100
Received: from mail-gh0-f198.google.com ([209.85.160.198])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 04:10:25 -0800
Received: by mail-gh0-f198.google.com with SMTP id r18so26358403ghr.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=XHgzymbtvemYiJJTYWLRBhNvbavg4DCQkTY2XptDpds=;
	b=QJoura4s5CdcJClJHPSCBajSTXjeuOk4XfHHNSPcvpUml8b+4i1Qwn4zCyrwF3ZXC6
	v58rJWzKnoQFzt6oDgensSaWgevTNwWLEq0EH06sfOq65fNifd9uZdHlfNvVPD7PR9RQ
	n1YIjtj8YEQiAgeWp5Qlo+aOcLUlLEtlasfvxwgHl9lEwqFgyD87G/e7vZTFO8Z1nct0
	JYYeLvc9TgU5IJ+Z1n5pnDeKlpwRkCFn7V1H8etP1NjhH8Sn57xuLxirwI+cP9zyBTsc
	3Mi+uLJ3jnZYcpsXTqotsb5Kl/RDmsVcpBklWsn7hL+hoXoWcLhQSF46yH2ptq9lkK0L
	5j+g==
X-Received: by 10.58.239.162 with SMTP id vt2mr85480523vec.1.1357560624385;
	Mon, 07 Jan 2013 04:10:24 -0800 (PST)
Received: by 10.58.239.162 with SMTP id vt2mr85480519vec.1.1357560624313; Mon,
	07 Jan 2013 04:10:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Mon, 7 Jan 2013 04:10:04 -0800 (PST)
In-Reply-To: <50EAB9C9.1090903@linaro.org>
References: <50EAB9C9.1090903@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jan 2013 12:10:04 +0000
Message-ID: <CAJTo0LZh_uw9Q3yY+1kxaMLwMp8n-_LujKV3Tk6pkMcKtFfx2g@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Gm-Message-State: ALoCoQkome/ZRqoQ18mk8GaUBkVGm3iA++bR4KxFcp51N0QnAUsxVPW/ynf0wpZPdJYXip8FYrhlGPAomTKeJCRfxOIkb41DN3i/60Ist5aKEW4KjH6DDdjvP+Znt1lDeaWXKqXWCSg1gzV6gRk97fzUzOG6maCABJNY9cIrzyq9lF+q1UTi+B37NJfFt5StWFgLf0tF8tm+
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Default xorg.conf is for x86 devices
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
X-List-Received-Date: Mon, 07 Jan 2013 12:25:36 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 12:04, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> Can we replace default xorg.conf with empty one? I finally got X11
> working on AArch64 just to notice that I have to remove xorg.conf file
> to get them started.

I'm all for removing xorg.conf wherever it's possible assuming it
still works.  The default should be no xorg.conf with machine
overrides where required.

Ross


