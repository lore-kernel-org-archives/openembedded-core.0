Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 60BC86B50A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 17:02:33 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id r14so19099804qtp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 09:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CyWprSkK5QpoAD/RztYAsHh5qYsGV8N+i+c7nPVZ1dw=;
	b=Q9v0TXt2DvkBoy8U1M32Uh+X5Q5APYvUCu85OIWuWSBBrnIvuh3iNrMuMPZTTcGSCl
	XUlq6Vkwc93OjhyzqlLpPrT9/YcF7pk6PQ/nU05lzPzbDjoEw844+M00fhVtUE1evT9b
	sodpowt6gDKgOrZRRpJmASoFncIbC3x1HFUJq2P8aVS6IOT6FApJuzm1WjjwpDeTaliv
	4vCyVHVfKYmuBl0R0MUQl8iy/Fp84+mcF0F+RGRk2b9P3aZ2JEONvvGhEVCPMQ7+UWwG
	e9gl8xfe4CeVFjCo8gxO09hmlqaSZ60Q9GX132Nmw6li1d/i18+O1QjkQYCVZao9pKYE
	6log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CyWprSkK5QpoAD/RztYAsHh5qYsGV8N+i+c7nPVZ1dw=;
	b=e4/N5IJVamBOLuSnKJbG4gwyUjtI/OCq+b0aQcUMfrgnsqm9BSjGB7tuC16WzCq3Lg
	IAqtK9C/85n3D7z0Mae8FNT+cp1eMtcrkQp0+Q97qcZIiYPokiHXiidIqrBhFb/Jm0IA
	8Y7eMZqOJUeaIrUwS2IpX3W/QhJMpQQ37xfD4IT+z8op8DWKRFSYgNrggeJ2yA0aRuKG
	fxUxH1Iwkv/NCyWhNRmVxTvvaarjMToOjm+XHjVG6anyo2ZfdgCpsHd1GgAe52VAI9jE
	3/0kul9uYxn80Yq505Ek1DlpGvmWVwTVFoLR+cQvGE7+YXEaUGP//YtDX563nLLec6lc
	n0MQ==
X-Gm-Message-State: AJcUukdunX2R1DSnZNCNJzuXmzoL92NisHXnLrDMmfcxo4HE+09OEIpD
	hqWwCF6s3oSb5iXy3it+a9VHe3holDLR+jGveu6XwFlT
X-Google-Smtp-Source: ALg8bN4dDT53PPxILL/UoaV6uMHaSfrmO112DQt4owyzWBuN9YWbh2Eq5uEkKyxsRSs23xLscMBHRhKEircbPZt80Uk=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr21122335qvq.55.1548694953912; 
	Mon, 28 Jan 2019 09:02:33 -0800 (PST)
MIME-Version: 1.0
References: <1548660808-65505-1-git-send-email-sudhirx.sharma@intel.com>
In-Reply-To: <1548660808-65505-1-git-send-email-sudhirx.sharma@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jan 2019 09:02:06 -0800
Message-ID: <CAMKF1srP7ts_99SF6udk7dNhgMRWX8oD0qqrPaASG=ZPif4naw@mail.gmail.com>
To: Sudhir Sharma <sudhirx.sharma@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Converted the manual Runtime testcase to json
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
X-List-Received-Date: Mon, 28 Jan 2019 17:02:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2019 at 12:14 AM Sudhir Sharma <sudhirx.sharma@intel.com> w=
rote:
>
> Added json file of converted manual runtime testcases(compliance test cas=
es)
>
> Signed-off-by: Sudhir Sharma <sudhirx.sharma@intel.com>
> ---
>  meta/lib/oeqa/manual/compliance-test.json | 142 ++++++++++++++++++++++++=
++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 meta/lib/oeqa/manual/compliance-test.json
>
> diff --git a/meta/lib/oeqa/manual/compliance-test.json b/meta/lib/oeqa/ma=
nual/compliance-test.json
> new file mode 100644
> index 0000000..7adf8a1
> --- /dev/null
> +++ b/meta/lib/oeqa/manual/compliance-test.json
> @@ -0,0 +1,142 @@
> +[
> +    {
> +        "test": {
> +            "@alias": "configuration.configuration.LTP_subset_test_suite=
",
> +            "author": [
> +                {
> +                    "email": "corneliux.stoicescu@intel.com",
> +                    "name": "corneliux.stoicescu@intel.com"

do we have to hard code email addresses ? maybe we can insert them via
environment.

> +                }
> +            ],
> +            "execution": {
> +                "1": {
> +                    "action": "For real hardware, run following componen=
t, \nsyscalls \nfs \nfsx \ndio \nio \nmm \nipc \nsched \nmath \nnptl \npty =
\nadmin_tools \ntimers \ncommands  \n\nFor QEMU, run following component \n=
syscalls \nmm \nipc \nsched \nmath \nnptl \npty \nadmin_tools \ncommands \n=
\nRun Instructions: \nLTP download: http://sourceforge.net/projects/ltp/fil=
es/LTP%20Source/ltp-20120401/ltp-full-20120401.bz2/download  \n\n(link is o=
utdated, always use the last version released or the one found in the image=
)  \n\n\n\nbuild steps: refer to http://ltp.sourceforge.net  \n\nRun steps:=
",
> +                    "expected_results": ""
> +                },
> +                "2": {
> +                    "action": "Build LTP with toolchain or in sdk image.=
 Or use a sato-sdk image which has LTP already included in /opt/ltp",
> +                    "expected_results": ""
> +                },
> +                "3": {
> +                    "action": "For QEMU, create the qemu target with \"-=
m 512\", which makes some memory stress cases pass. For some issues, we cou=
ld only set 128M for qemuarm and 256M for qemumips.",
> +                    "expected_results": ""
> +                },
> +                "4": {
> +                    "action": "Copy LTP folder into target, for example,=
 /opt/ltp if you have built it yourself. Modify the default scenario file \=
"scenario_groups/default\", remove test suites not to be tested",
> +                    "expected_results": ""
> +                },
> +                "5": {
> +                    "action": "Comment runtests/sched: hackbench, which =
is not suitable to run in emulators. Reminder (comment it also for Sugarbay=
 Devices).",
> +                    "expected_results": ""
> +                },
> +                "6": {
> +                    "action": "Comment oom01, oom02, oom03, oom04 in run=
test/mm, which consume lots of memory",
> +                    "expected_results": ""
> +                },
> +                "7": {
> +                    "action": "From /opt/ltp run: ./runltp -p -l result-=
M2-20101218.log -C result-M2-20101218.fail -d /opt/ltp/tmp &> result-M2-201=
01218.fulllog \n\n",
> +                    "expected_results": "Check the result on wiki, https=
://wiki.yoctoproject.org/wiki/LTP_result, there should be no regression fai=
lure met."
> +                }
> +            },
> +            "summary": "LTP_subset_test_suite"
> +        }
> +    },
> +    {
> +        "test": {
> +            "@alias": "configuration.configuration.POSIX_subset_test_sui=
te",
> +            "author": [
> +                {
> +                    "email": "corneliux.stoicescu@intel.com",
> +                    "name": "corneliux.stoicescu@intel.com"
> +                }
> +            ],
> +            "execution": {
> +                "1": {
> +                    "action": "In a sato-sdk image go to /opt/ltp or get=
 latest LTP sourcecode,  download location is  http://sourceforge.net/proje=
cts/ltp/files/LTP%20Source/  and install it.",
> +                    "expected_results": ""
> +                },
> +                "2": {
> +                    "action": "Go into the folder of LTP, and posix_test=
suite is under testcases/open_posix_testsuite/",
> +                    "expected_results": ""
> +                },
> +                "3": {
> +                    "action": "Run connmand: make generate-makefiles",
> +                    "expected_results": ""
> +                },
> +                "4": {
> +                    "action": "Run connmand: make conformance-all",
> +                    "expected_results": ""
> +                },
> +                "5": {
> +                    "action": "Run connmand: make conformance-test (this=
 step may show errors, ignore them)",
> +                    "expected_results": ""
> +                },
> +                "6": {
> +                    "action": "Run connmand: make tools-all",
> +                    "expected_results": ""
> +                },
> +                "7": {
> +                    "action": "Run connmand: sh posix.sh > posix.log, po=
six.sh as below:  \n \n#!/bin/sh \n./bin/run-posix-option-group-test.sh AIO=
 \n./bin/run-posix-option-group-test.sh MEM \n./bin/run-posix-option-group-=
test.sh MSG \n./bin/run-posix-option-group-test.sh SEM \n./bin/run-posix-op=
tion-group-test.sh SIG \n./bin/run-posix-option-group-test.sh THR \n./bin/r=
un-posix-option-group-test.sh TMR \n./bin/run-posix-option-group-test.sh TP=
S  \n \n",
> +                    "expected_results": ""
> +                },
> +                "8": {
> +                    "action": "Check the posix.log after testing is fini=
shed",
> +                    "expected_results": "Compare the test result on wiki=
, https://wiki.yoctoproject.org/wiki/Posix_result, there should be no more =
regression failures met."
> +                }
> +            },
> +            "summary": "POSIX_subset_test_suite"
> +        }
> +    },
> +    {
> +        "test": {
> +            "@alias": "configuration.configuration.LSB_subset_test_suite=
",
> +            "author": [
> +                {
> +                    "email": "corneliux.stoicescu@intel.com",
> +                    "name": "corneliux.stoicescu@intel.com"
> +                }
> +            ],
> +            "execution": {
> +                "1": {
> +                    "action": "Get lsd-sdk image and install it on targe=
t device or start the image(if it is QEMU) with option \"-m 512M\"",
> +                    "expected_results": ""
> +                },
> +                "2": {
> +                    "action": "Comment in /opt/lsb-test/session any test=
s you don't want to run.",
> +                    "expected_results": ""
> +                },
> +                "3": {
> +                    "action": "Run /usr/bin/LSB_Test.sh which should dow=
nload the LSB suite and set it up. Some packages may fail to download becau=
se their location changed on ftp.linuxfoundation.org. You need to manually =
update /opt/lsb-test/packages_list",
> +                    "expected_results": ""
> +                },
> +                "4": {
> +                    "action": "Tests should start automatically, you can=
 use the web interface to reconfigure the setup. ",
> +                    "expected_results": "Check the result on wiki https:=
//wiki.yoctoproject.org/wiki/LSB_Result No regression failures should be me=
t."
> +                }
> +            },
> +            "summary": "LSB_subset_test_suite"
> +        }
> +    },
> +    {
> +        "test": {
> +            "@alias": "General_Runtime.General_Runtime.stress_test_-_Gen=
ericx86-64",
> +            "author": [
> +                {
> +                    "email": "corneliux.stoicescu@intel.com",
> +                    "name": "corneliux.stoicescu@intel.com"
> +                }
> +            ],
> +            "execution": {
> +                "1": {
> +                    "action": "Bootup with core-image-lsb-sdk image",
> +                    "expected_results": ""
> +                },
> +                "2": {
> +                    "action": "Execute the crashme test with below comma=
nd  \n\n./opt/ltp/runltp f  crashme",
> +                    "expected_results": "The stress testing should not m=
ake the target crash. Check CPU usage and basic functionality of the system=
 after the tests are over. "
> +                }
> +            },
> +            "summary": "stress_test_-_Genericx86-64"
> +        }
> +    }
> +]
> \ No newline at end of file
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

