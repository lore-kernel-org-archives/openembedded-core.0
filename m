Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id EA70377E83
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 13:54:51 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id c11so80724795wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=8ifGnSdADHQ75I1L6i3Un5Z2aWMwDd0kgx0cRSC7H00=;
	b=UluwD1VmHRkzpbNVyXs9nMmx82fNhwIk0Lb3+PM5QXmGwGM7y22wKloXIP2p1D4pa6
	UBYwTmRBgI8HU022UN3Df13an6X8WAZ93emRK1jcJk20LN+igcohMELqxa6K4AJqVOYa
	i6ZklYfsFnav4mOgYq+1Y+aagYDiGptHln/Fs2t0HtEgB0w3iOqEq1lpqTr7rfDV/U43
	RT/dxKzz6dxMXHJfHcjX5Y02iqVqTuShNq4x3uWQYYdzRYin8BswFjfpaXbav9C1wRT1
	ulNmbLOTF8QefgWXL8ua0QB5wvzl1GzTqRWCzkATIl6gqONioLTzcknjcD+uD+3qGyVe
	u2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=8ifGnSdADHQ75I1L6i3Un5Z2aWMwDd0kgx0cRSC7H00=;
	b=jDvvY4dBugNT7HQgXlcg8uqHLi8oN8kPJFIO4kRsj8bRU9P73/bFt2tia3Gb1/b3eH
	VGxvm3mcwGF7mcC3FaB4hh6VuXPbkbPUqSbaZUq4iiXoKSzGYeXgm6OdT6jFH2TrqJhC
	yEZi242hPASLz+BWA3S+D2WSwvH5zDU2ReS1k3fSSyQjyGRFDRet570AYa+L1G9VOxaW
	PcVrgr4mRWAfiSCoX+1RS788TnFvi/1rXgIV3++U/4z3AmHjiVHql8L9Obkiim+hUkCv
	8LqOJDHl1cAzpdThHdicmya7DOAXB0KmAPdoMIUUuNZ+C+BdtTC6juLgtgaoUd8PVHQR
	jKWw==
X-Gm-Message-State: AKS2vOwx9uC96rKt0vpsufwP66DVnCRMMkLQsFrqMblg+cI3Z+ZGIbDJ
	LEkVgu/yPmh4jP8PFfo=
X-Received: by 10.223.150.89 with SMTP id c25mr23343229wra.15.1498053292214;
	Wed, 21 Jun 2017 06:54:52 -0700 (PDT)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com.
	[209.85.128.182]) by smtp.gmail.com with ESMTPSA id
	e77sm13080772wma.32.2017.06.21.06.54.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Jun 2017 06:54:51 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f182.google.com with SMTP id c11so80723850wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 06:54:51 -0700 (PDT)
X-Received: by 10.28.105.85 with SMTP id e82mr6883961wmc.122.1498053290967;
	Wed, 21 Jun 2017 06:54:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.176.5 with HTTP; Wed, 21 Jun 2017 06:54:50 -0700 (PDT)
In-Reply-To: <14e5f528-a64b-94e2-4e86-7a22770623d6@yadro.com>
References: <14e5f528-a64b-94e2-4e86-7a22770623d6@yadro.com>
Date: Wed, 21 Jun 2017 10:54:50 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqsE05hFa5GnCptTYwhr=e8r7csjwymC=xKMwfsvyJvrg@mail.gmail.com>
Message-ID: <CAP9ODKqsE05hFa5GnCptTYwhr=e8r7csjwymC=xKMwfsvyJvrg@mail.gmail.com>
To: Anton Novikov <a.novikov@yadro.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] (morty) Arch Linux build fixes
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
X-List-Received-Date: Wed, 21 Jun 2017 13:54:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 21, 2017 at 6:05 AM, Anton Novikov <a.novikov@yadro.com> wrote:
> Thanks,

I support those too; I've been using it here as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

