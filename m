Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE2560664
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:15:27 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b15so2397624lfc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 06:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=K2WT26d7TUDaPZXbhFZ96kEUP/rQun04dlnbuMOud2Q=;
	b=I6pUsTOHVbm+gjB6z/Igx4vth4YEYtm62zZ1vK/soGYzbe+1dal8OkYr3uJ68GrmkH
	9snaQWcxq0eShv7ip+to2ASWFEHlb8CC5LbkwlsQsLU0HGEeV/pk8zecrbI2Shn/eNCX
	genWTP0pyRzMeuhGD0isvSs3brdLSQqx0GkIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=K2WT26d7TUDaPZXbhFZ96kEUP/rQun04dlnbuMOud2Q=;
	b=k1FB2oDlkqhB92PKjTXq+27AZ88va4DcOjmgB1lYy3Kk5dlEK37mrPHYBOOFoMhr9m
	qKWm8+sbvXFy3KzWHsRS7jN0TQkmoSYivzSdcQ1tE2UV18MzHlU11C3B4UMbdxpGKm3J
	QqGE+FKVRIuWxlVY8Wft/a4qcUZS9XxxiKi7XqIjNsjodVPJMzq/UYI9t7Z6LPBW8RF2
	x9wqt0cWRWPiELmwGD69CI8EI1qJ6ZKgocLezq9miHCWxw8FOVTyGVsFH8BSRhgmg05l
	4Jp3HhY1scOk42dhUxk8DIW6imtbCkej5BoVZmOsQs7xz4UkJ8vX/gwnGsBzw90BqVNC
	Up2w==
X-Gm-Message-State: APjAAAVr68Jd3Jt11+ZAOz+/EJ2ia3/+ervmrBxJYoW82QDZ6qYCwKVN
	zBz761YooSMwJqSlX+rUOEymJEHEY+Y=
X-Google-Smtp-Source: APXvYqzSgct09iRe6A6KmgUBNuZEkEQM890YAJPrhcWgguLdLNaKWq3Xktag08OfzbtXn54SV5q0Rg==
X-Received: by 2002:adf:fd84:: with SMTP id d4mr34558658wrr.211.1580299201651; 
	Wed, 29 Jan 2020 04:00:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 4sm1976079wmg.22.2020.01.29.04.00.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 04:00:01 -0800 (PST)
Message-ID: <10d77c789a51e9fdb089b2faf983414cc17fb20b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jan 2020 11:59:59 +0000
In-Reply-To: <CAMKF1sqYswYbOA+N80sK3sELzPPCTymDna8bgSKETCvZROi2Fw@mail.gmail.com>
References: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
	<20200128151643.9711-3-richard.purdie@linuxfoundation.org>
	<CAMKF1sqYswYbOA+N80sK3sELzPPCTymDna8bgSKETCvZROi2Fw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] texinfo/texinfo-dummy-native: Drop native path prefix
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-28 at 18:00 -0800, Khem Raj wrote:
> it perhaps is the reason for most of failures seen here
> 
> https://errors.yoctoproject.org/Errors/Build/97736/
> 
> perhaps we need to explicitly inherit gettext in these recipes ?

These patches aren't quite working in master yet but those failures
look like they'd be solved with an "inherit texinfo" added to the
recipes.

Cheers,

Richard




