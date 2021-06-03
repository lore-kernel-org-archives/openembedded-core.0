Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.129.1622750014244705192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 12:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pm441uoF;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id h24so11037609ejy.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 12:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CzlNQyHrh6goW86vR4rTrg823whPaEvAbcfOPJKReM8=;
        b=Pm441uoFPeVW8oE8bGs8ylCNTryJa42SdD7G7dPqHJg/xr9f0Urt1bgM1nmJjYYMT0
         w7qO/rmALiioIjk2MXVxMPHPCevyqJiX7w9b58Ed9ADU1eylA87W4/N4lkZhgBqkxTHI
         6JZ+/jDH+/tqVSr2TA0k6XNw/bFW+yLJm1TpEaeo1u7+Maio2DVvFsnzX2obOyAud299
         XYA8mv6uBY0tqDuJCS3FQUfVk6dClMpJO7WW8I5UVAIyyVJEmfvPqnj3VzukV7xMbClU
         UeP49cso02mBrScSJEzQ5oT+NX6u8Zm0a1cV6g0X7MUeTyQ1XLasL2lernqMrZP1Y9jV
         yQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CzlNQyHrh6goW86vR4rTrg823whPaEvAbcfOPJKReM8=;
        b=qHMOtUP/3vL2dSWyVVOdduYAuvnpQ4GMH5AVGJM5c0FYZPS7BdJHUTX76kH0kwR4pX
         +ZtXGYkV6vNCQ2tRaQPTZgXUXsuH0c+iBbsqqKe2Gi02sDPxfUxaxKdtdVCDvJIJ7MXo
         +ZFHry3oo9J+/t4dVBON2+nVbE+MGQgpD5hC90gC+s+tCDvi2qsuQs9431T4J5LoRGmp
         uPW1+5gZ0GTb6iz+sQlkQdZiRGhPPmj7F89UPzBVSwgl1SAV9pzCc1IrORGRO4ANQeq7
         CbmIkbtFWv1S+DA174uBDD876grPiegcVuC+UaQLSqcGVlNvg/Pk03Hs/8vbnDUVPK6S
         3yAw==
X-Gm-Message-State: AOAM531pi0GK0DDQLX2VAytSiZj8kP/K6Y6shRPwIb6RZuzS7tq7/s43
	HEzUFyk440h+UTnTKlY96lE=
X-Google-Smtp-Source: ABdhPJzzHiX6eMcLUMH0E8MJNUqqyXXWaVxb4qjg7WoSz7zSmlaFF0WnQcpe29C87OOfFoMkn67qhg==
X-Received: by 2002:a17:907:c02:: with SMTP id ga2mr856555ejc.513.1622750012586;
        Thu, 03 Jun 2021 12:53:32 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id f26sm2213391edu.31.2021.06.03.12.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 12:53:32 -0700 (PDT)
Message-ID: <f33e8c790fa4ef0364b91b91a514dd0ec308a008.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] meta-skeleton: add a ptest example
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Jun 2021 21:53:30 +0200
In-Reply-To: <CANNYZj9HDXbUm=3LJ3tio4JMKQ56vrMGiYVkHBy9hCNOf=a4Lw@mail.gmail.com>
References: <20210603172149.100248-1-adrian.freihofer@siemens.com>
	 <CANNYZj9HDXbUm=3LJ3tio4JMKQ56vrMGiYVkHBy9hCNOf=a4Lw@mail.gmail.com>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Alex

On Thu, 2021-06-03 at 19:46 +0200, Alexander Kanavin wrote:
> Rather than construct an artificial example, is there an actual
> existing ptest in oe-core that can be extended to do this junit xml
> stuff?
So far there is no test which creates xml reports and I don't know if
oe-core would have interest in something like that.

In general, a minimalist ptest example could be quite useful. I get
asked about it from time to time. However, I see your point that the
example is somewhat artificial. What do you mean if I replace the xml
with a simple "example report" for example?

Regards,
Adrian
> 
> Alex
> 
> On Thu, 3 Jun 2021 at 19:22, Adrian Freihofer <
> adrian.freihofer@gmail.com> wrote:
> > ---
> >  .../ptest-example/files/run-ptest             | 26
> > +++++++++++++++++++
> >  .../ptest-example/ptest-example_0.1.bb        | 16 ++++++++++++
> >  2 files changed, 42 insertions(+)
> >  create mode 100644 meta-skeleton/recipes-skeleton/ptest-
> > example/files/run-ptest
> >  create mode 100644 meta-skeleton/recipes-skeleton/ptest-
> > example/ptest-example_0.1.bb
> > 
> > diff --git a/meta-skeleton/recipes-skeleton/ptest-
> > example/files/run-
> > ptest b/meta-skeleton/recipes-skeleton/ptest-example/files/run-
> > ptest
> > new file mode 100644
> > index 0000000000..7c80306475
> > --- /dev/null
> > +++ b/meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest
> > @@ -0,0 +1,26 @@
> > +#!/bin/sh
> > +
> > +# The result should be PASS, FAIL, or SKIP, and the testname can
> > be
> > any identifying string.
> > +# The ptest-runner does not evaluate stdout or stderr. The output
> > format is a recommended convention.
> > +# A real ptest would call the unit-test executable instead of
> > echo.
> > +echo "PASS:  dummy test passing always"
> > +
> > +# Optional a ptest might provide a JUnit like XML report. Reports
> > are collected by the ptest imagetest if
> > +# the TESTIMAGE_PTEST_REPORT_DIR variable is configured for the
> > tested image.
> > +# Example to fetch a xml report to ${TEST_LOG_DIR}/reports-
> > xml/ptest-example.xml:
> > +#   TESTIMAGE_PTEST_REPORT_DIR ?= "/tmp/ptest-xml/*.xml:reports-
> > xml"
> > +# The following shell heredoc is as a placeholder e.g. for
> > something
> > more useful such as
> > +# my-gtest --gtest_output="xml:/tmp/ptest-xml/"
> > +mkdir -p /tmp/ptest-xml
> > +cat << xxxEOFxxx > /tmp/ptest-xml/ptest-example.xml
> > +<?xml version="1.0" encoding="UTF-8"?>
> > +<testsuites tests="1" failures="0" disabled="0" errors="0"
> > time="0.010" timestamp="2020-09-20T10:44:23" name="AllTests">
> > +  <testsuite name="ConfigurationTest" tests="1" failures="0"
> > disabled="0" errors="0" time="0.010" timestamp="2020-09-
> > 20T10:44:23">
> > +    <testcase name="readConfiguration" status="run"
> > result="completed" time="0.010" timestamp="2020-09-20T10:44:23"
> > classname="ConfigurationTest" />
> > +  </testsuite>
> > +</testsuites>
> > +xxxEOFxxx
> > +
> > +# The ptest-runner evaluates the exit value of a test case: 0
> > means
> > pass, 1 means fail.
> > +# This minimal example passes always.
> > +exit 0
> > diff --git a/meta-skeleton/recipes-skeleton/ptest-
> > example/ptest-example_0.1.bb b/meta-skeleton/recipes-
> > skeleton/ptest-
> > example/ptest-example_0.1.bb
> > new file mode 100644
> > index 0000000000..02bc9bcfa2
> > --- /dev/null
> > +++ b/meta-skeleton/recipes-skeleton/ptest-
> > example/ptest-example_0.1.bb
> > @@ -0,0 +1,16 @@
> > +SUMMARY = "A very basic ptest enabled recipe"
> > +DESCRIPTION = "This recipe provides a minimalistic ptest package"
> > +SECTION = "examples"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM =
> > "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4d
> > e2
> > 0420"
> > +
> > +# A recipe is "ptest-enabled" if it inherits the ptest class
> > +inherit ptest
> > +
> > +# Usually a ptest contains at least two items: the actual test,
> > +# and a shell script (run-ptest) that starts the test.
> > +# For this minimized example there is just the script.
> > +SRC_URI = "file://run-ptest"
> > +
> > +# This minimalistic example provides nothing more than a ptest
> > package.
> > +ALLOW_EMPTY_${PN} = "1"


