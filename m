Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3pJ1-0006YT-Q9
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 15:52:00 +0100
Received: by mail-vb0-f41.google.com with SMTP id l22so2417600vbn.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 06:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=T9sS5OoCQLwf6Tgcrq9qMUARRjvkOK2GrO57+KuL/Qw=;
	b=OdgWQT9MZrQduqPzTn9cM+Jt7t58DMDlpiarHYxZYw1XgX7VogLw87CGEyEvna7wrY
	2B/C+wndC0+Q8xhmqjblwfV3lI2bzvE5Fr3AsS8VFz7B8rY4MOxknSwdIThNvcg5GhaZ
	GM3Ly/CiCBBRMDUFs7K5OcjpA95VKy9QnWcjp0uYA5mxQQ4r65D6gtiqRqvPZZAfILAq
	6kZWmPhWJI+9LGYFL+kv7pzlF4j/dpRI50faFXahTrfW/WxVREJNWovAkektQHf2y+Ft
	cjiOz5Ji5eeDb9MopdblLhgxlAEjE/vfnlzEI7Fc+6nuXEiHY8zkoq1S00SSoGYIaN2x
	xz4Q==
X-Received: by 10.58.229.197 with SMTP id ss5mr7087281vec.14.1360334165591;
	Fri, 08 Feb 2013 06:36:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 8 Feb 2013 06:35:45 -0800 (PST)
In-Reply-To: <CAK18fxHFcZzx1SCqfQ8SPGoffgXwdUer2CtKHcA1Ehru0J3-GA@mail.gmail.com>
References: <1360269352-11713-1-git-send-email-ross.burton@intel.com>
	<CAK18fxHFcZzx1SCqfQ8SPGoffgXwdUer2CtKHcA1Ehru0J3-GA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 14:35:45 +0000
Message-ID: <CAJTo0Lbj6yeqON_3bTMA-e3khVDq+5+3HjYP-UeFu-7v5Di3rQ@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQnIGD4QMTTs8foqOyjKOD+lcq6s9IVHo6fIuHZ1PI4OcEHf2FpVYe5uIyeIYlDhXgmmssTo
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "update-rc.d: disable update-rc.d.bbclass when systemd enabled"
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
X-List-Received-Date: Fri, 08 Feb 2013 14:52:01 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2013 14:07, Andrei Gherzan <andrei@gherzan.ro> wrote:
> I understand this. But there should be a way to remove all init scripts for
> configurations where systemd is not in compatible mode.

Yes, and in my current branch which adds a systemd class, if a recipe
inherits both systemd and update-rcd, update-rcd turns itself off.

Ross


