Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id B9EE07F8BD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 23:51:57 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id g12so4654471ild.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 15:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=RACOxHQSHV7GW0hwrtA7m7O+cXXSrwcLIf09WsmkIH0=;
	b=IOO/V+6k713LtxDDwS9Zw6MhY1eD+Lkx/LjJI+9CF5JGMdD2BRkHfWYq//tbVERGBO
	J/aQVXXSZjE/mpkWxmCkIdmfezDlFUhNy5KEchp1L5NYMh1JdlvJOf8rhWieW1pZnwiz
	1Yw+s/+5Z9ltyl2gKCdLaScD8sYvHA6k4TFoo1U3Lt+XAvJ7J5K4F/UXndNYOpyIq+dr
	A2Yi05GTtIX4N2EQe0y2JXZTZkUJHeInhzQ5DJTE9a2aFk2ZfNFlr5f0jL+GutohW3Ci
	THtcm2xRGZVr9jG6B6Mosn05nZmfidupulH+nLzt9Z+1FXhmCa50zwgKmZyar+U03k+i
	HATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=RACOxHQSHV7GW0hwrtA7m7O+cXXSrwcLIf09WsmkIH0=;
	b=TgnFjwSaBpJEDupm1WbdmT+o+Nyu0hxYV+DKKDAXz2HhN59sidoPf38XQ58ZeGlkle
	fGzlSV7u8UD1lTfjJXF6LEpa7S/j+HhAf4I8mZ5lCdU8p0m6OSid6TOYl8pEzINCt6Nv
	9xMNP55iuVTaW76NKbEGUqbj8Odiyd7L8q0uugJyCM6bqAAGIlxYQJv0GtwLyTTdRdBz
	oxVbT+A6LLaI9vyA7B2ubk7VToMEuw8gveZkjARFhIxhS9ZmfC+B9Ilf+oHGgez23tNT
	B395CFbPh0dAp7vH7huqOrN3baNcbCB+6tD9MP+bRLtoYeASsxr/dmnbzBZTuUc+fX8q
	2/ww==
X-Gm-Message-State: APjAAAVDXOx9C4t7OV6XggHXWHKpmazkodaUj9+vAGh4nEChCi+jY+pJ
	qOh8odIVG/mURXJD32Cql1uXv/OvalLK6VnLUq8r/Q==
X-Google-Smtp-Source: APXvYqy1sVBoda2QBOCIE+q9DSZwpC2IcYCmbYRESCZwyRJA2YCrMh0h8W5oz/K+dtEOcwIPRbKeFbLQ3rt50qSmpIo=
X-Received: by 2002:a92:d5cf:: with SMTP id d15mr11183631ilq.306.1575589918437;
	Thu, 05 Dec 2019 15:51:58 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:f24e:0:0:0:0:0 with HTTP;
	Thu, 5 Dec 2019 15:51:58 -0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Fri, 6 Dec 2019 10:51:58 +1100
Message-ID: <CAA=hcWRc087t=w3tm00awTakdeytwVSrKsHzNckS=dsLfDrB=Q@mail.gmail.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Subject: glib-2.0-native recipe
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
X-List-Received-Date: Thu, 05 Dec 2019 23:51:57 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I am building libqmi which has dependency on libmbim which has
dependency on glib-2.0-native, but I could not glib-2.0-native recipe,
appreciate a clue.

Thank you.

Kind regards,

- jh

