Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web11.7750.1593081772096890055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nWNJlSCF;
 spf=pass (domain: konsulko.com, ip: 209.85.210.67, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f67.google.com with SMTP id 5so2795943oty.11
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vS5lBWRCi/UbNrj3E6s+Zy0WLv23e5x/1NPEx59yAw0=;
        b=nWNJlSCFwHZMlPqM5bFpW+gMqY3j1a5IzMgBkxsoCl18JqUjghgf6o1scv2oQffOFh
         J7SmlBQpkwSjvaj+52ttnDv6lFZjRvORtDSpOkrcWXbHkEwbfaB5LybTT2XQeaLf7rY6
         LFg/61fBl3AR7A+wU2XcGKrqi/yYhIXKFiS84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vS5lBWRCi/UbNrj3E6s+Zy0WLv23e5x/1NPEx59yAw0=;
        b=OFALYLAC9lufVYXdEmD+bvJiLo5Wt49484H5ZNNHJ/+vEGztr3G54VZ5fVgg6tWFcY
         8zEwOXDkiEdu7jY7TCOrNqeXm3rOvrN1t8tKLlvpCj5OO2dP79as1KU2Fzky8vmp5BXT
         ZFB1jBqs6C8MUujjJtlav7wrrHgSBPt0PDn8icRdWsLwXsB7Gc6jYFL4SNfsE38fUc+/
         GtNgfjTM6m3N3R3r/tJnPSQ+MmZgMGdYKoNsqgFKHDXZymlTUVtLyBc7i71rxkK+uQiA
         zZenKNofIB0n+qLrqm2mk+Lj7ogXSpFTd4C+zdYhlAtUONL1tGejMKCl4X10umXeW+9Y
         cTlg==
X-Gm-Message-State: AOAM533w5znYpbJY9rybKDBaMo14vwHVZQeyWL+4Qbr7qKio2su1biQF
	gqmuveiQqrcK0eFqgJmLcmgDjw9r0bcA3HJP3iSQ4A==
X-Google-Smtp-Source: ABdhPJyLnQXjYNjzBs0CEMcKA6ivlQWH/9jaSx8fSiN3r2IBx7y6PyXaYoEfYa+U5jgBSUeRraesC6Qfz9bChbuUAB0=
X-Received: by 2002:a9d:6c02:: with SMTP id f2mr11492194otq.258.1593081771463;
 Thu, 25 Jun 2020 03:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200625102145.7139-1-fredrigu@axis.com> <20200625102145.7139-22-fredrigu@axis.com>
In-Reply-To: <20200625102145.7139-22-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 11:42:41 +0100
Message-ID: <CAM9ZRVuTRzpTYvZk2e0HKE+VyFHftuwe4m-tF9NujkPYcE4ZMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 21/26] package_manager.py: Move DpkgIndexer
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <hugo.cedervall@axis.com>, 
	Fredrik Gustafsson <fredrigu@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 11:22, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> Let the code that is only used by opkg package manager live in that

Typo here: This commit moves the dpkg indexer not the opkg one.


--
Paul Barker
Konsulko Group
