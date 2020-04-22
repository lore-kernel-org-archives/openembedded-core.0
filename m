Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com [67.219.246.1])
 by mx.groups.io with SMTP id smtpd.web12.2983.1587519127501320143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 18:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digiinternational.onmicrosoft.com header.s=selector2-digiinternational-onmicrosoft-com header.b=qRBRpMlY;
 spf=pass (domain: digi.com, ip: 67.219.246.1, mailfrom: dan.callaghan@digi.com)
Return-Path: <Dan.Callaghan@digi.com>
Received: from [100.112.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.us-east-1.aws.symcld.net id DC/82-31195-69E9F9E5; Wed, 22 Apr 2020 01:32:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMJsWRWlGSWpSXmKPExsWSoW+1TnfqvPl
  xBo/71C26dx5gtbjz8x27A5PHzll32T3ObVzBGMAUxZqZl5RfkcCaMeFUD1vBQdmKI/OUGxjX
  S3QxcnEwCixllpg97xQbhHOMRWLtw30sEM4mRolzP5cwgjgsAkeYJaZeeADkcAJlIiS+3p3AB
  GILCSxmklh5ShCkSEjgMaPEw5bJQLM4OJgF1CXWzxMCqWETMJBYN3cqG4gtIqArMf3dPmaIkj
  iJG0/MQcLCAvESj/ZvYgWxOQUCJU6++MQKMbKFUeL6rWVgvSwCqhLLXs0Cs3kFHCSON01iAbF
  FBcQkns98BNbMLCAv0bx1NjNIs4TAVEaJz4/2M0Mcqi6xevVTqGZBiZMzn4A1SwjoSPxd1Ai1
  bSGTxOuVP9khGuoljq5tYAS5VEJASeLmW2mIelmJo2fnQPX6SvQd3c8GM2fRyRXMEHaBxMV5j
  UwQtprEzo1NUGNkJK7sjYG4DRigt778Z5/AqDsLEVyzkLwwC8mlCxiZVzGaJRVlpmeU5CZm5u
  gaGhjoGhoa6RroGhma6SVW6SbplRbrpiYWl+ga6iWWF+sVV+Ym56To5aWWbGIEppSUAoYbOxg
  Xrn2vd4hRkoNJSZT3c+f8OCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvJtnA+UEi1LTUyvSMnOA
  6Q0mLcHBoyTC2zkXKM1bXJCYW5yZDpE6xWjMMeHl3EXMHO9+Ll7ELMSSl5+XKiXOawBSKgBSm
  lGaBzcIlnYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmVQImcSGezLwSuH2vgE5hAjqlXQ
  vslJJEhJRUA9NC5TvfPeof64nvywj6uEbjh2L048Dax3vEjaWXqh/jy319+sDqD8piAa57t72
  1vvJLWbj600z1KPeTyZ4qdvm+qWaS9izu0W5qjRls897JGR0MevejmbGOYUewcMy8lbp7/d+s
  9Xs4//nudK47Yn3V16JapXuOvA/+Mstn56PDTPwvTjJ1LXNKTksJ9Q06Wu/Za5E2f99Prs3cC
  hteqiQvm3JJU+rLVCMesWuCr493v66etqxuanDtpNcLTc5ri4Vd/rn4srmAoXJ19WV1uW+8Uc
  zsbLMvbH9V69tv97/g4PeWS7vMZ5zMa2ubeLH447UJC2RZCuvbNswPmC02g3XLmswVribbJny
  4uDcuzliJpTgj0VCLuag4EQCT93bENgQAAA==
X-Env-Sender: Dan.Callaghan@digi.com
X-Msg-Ref: server-27.tower-385.messagelabs.com!1587519125!3886404!1
X-Originating-IP: [104.47.58.174]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15518 invoked from network); 22 Apr 2020 01:32:05 -0000
Received: from mail-bn8nam11lp2174.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) (104.47.58.174)
  by server-27.tower-385.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2020 01:32:05 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3SMyUFthfLgyeksP9yc/36JHm3TfoHDyVKAO1o4nqBdlPX09U2bL8qw6U6HgiuTXci3PbLKa0OQrEGnU/TrMEuLK6miFDjbyLsLqRvJnjqKERXEyYq+hISPjpEXPN6SbMZ222kdCNz3GoNAwDKg4HWpncZIn8aXsmAwyFqtWHECA8kg01/szA8cDdbikiIJZOwbnLd8bZOuDkHlQrOA6ckK/BrhrwEM2je8L5zF+c8Map1NJaZKjF68SI6T2b061nALH+79uFa6aA7nPVASjhlY4aq//jzW3nC91JWfLqHw5P+QxnuH0CSoXuOABehFF3KgvVEFn56p4ptn2xcu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZjCDulyHk3ACBCEd85um/otcSaV62ELEMooWz3LN48=;
 b=NJ1KnhHNrxXbL0DfQkVEyCAPUT5atbwE8z7LgthgOj9buUfd6+QbupMm+Y61l+EcT/gqQa7HbEkI7T96Z40sjKlzyOfp+zJMBpC/CGDVDFgZxoNweZHKdv6okwUyVvpHO+9IJfRX3qu/ye9zzqnAEGnsQXfJxt9tpZouYuMEDd2lnzCxfCDjCbd399ZHB3a9Sz8Yk0/HdvMlZtMKTkI11GsXQzhHuufHug7zf5OcxeaNo8eWcvGN5CRXORS2ADY2JSVeDdwc9LsQE7/pnPPfKfZxeZd4i68m9ia/YkTrEP5L93ll56RdFqhT1X8+jxBxcIlulh+nCiliRP3R+Er3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digiinternational.onmicrosoft.com;
 s=selector2-digiinternational-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZjCDulyHk3ACBCEd85um/otcSaV62ELEMooWz3LN48=;
 b=qRBRpMlYXfinZaTJzGgiDg6hgCHaO/jYyz6quoCFjHzjs8Ll0vJ2HCGeQLReqazsvZlCEpERYgIRRZPtAtHWAjgvhfC1Alw6ktRBhfxYHy8oaDBXByXmv0zja5SlG0s0MUe0uqJu9E/DOhkdaHEWDfKZCBRzQQVsQZJ+kKUU+jI=
Received: from CY4PR1001MB2118.namprd10.prod.outlook.com
 (2603:10b6:910:40::35) by CY4PR1001MB2344.namprd10.prod.outlook.com
 (2603:10b6:910:44::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Wed, 22 Apr
 2020 01:31:59 +0000
Received: from CY4PR1001MB2118.namprd10.prod.outlook.com
 ([fe80::1de5:5498:680e:db6c]) by CY4PR1001MB2118.namprd10.prod.outlook.com
 ([fe80::1de5:5498:680e:db6c%3]) with mapi id 15.20.2921.027; Wed, 22 Apr 2020
 01:31:59 +0000
From: "Dan Callaghan" <dan.callaghan@opengear.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: copy some more needed files in do_shared_workdir
In-reply-to: <CADkTA4NGkRXf-jmvX9TooAEAr9RiA+0dWr01icYAKkp0yZZPCg@mail.gmail.com>
References: <20200421093732.29192-1-dan.callaghan@opengear.com> <CADkTA4NGkRXf-jmvX9TooAEAr9RiA+0dWr01icYAKkp0yZZPCg@mail.gmail.com>
Date: Wed, 22 Apr 2020 11:31:50 +1000
Message-Id: <1587518872-sup-9466@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
X-ClientProxiedBy: SYYP282CA0003.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:b4::13) To CY4PR1001MB2118.namprd10.prod.outlook.com
 (2603:10b6:910:40::35)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from galangal.danc.bne.opengear.com (59.167.222.237) by SYYP282CA0003.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:b4::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Wed, 22 Apr 2020 01:31:58 +0000
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)	id 5845A4238E69; Wed, 22 Apr 2020 11:31:50 +1000 (AEST)
X-Originating-IP: [59.167.222.237]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 218ca206-dbfd-4553-a98f-08d7e65cf344
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2344:
X-Microsoft-Antispam-PRVS: 
	<CY4PR1001MB23444FDDF8771CDA0B2DFBBA90D20@CY4PR1001MB2344.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 03818C953D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2118.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(346002)(136003)(376002)(366004)(396003)(39850400004)(316002)(66556008)(478600001)(53546011)(66476007)(52116002)(8936002)(44832011)(8676002)(42882007)(42186006)(83170400001)(26005)(81156014)(4326008)(5660300002)(2906002)(426003)(66946007)(6916009)(186003)(6266002);DIR:OUT;SFP:1102;
Received-SPF: None (protection.outlook.com: digi.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qj6tZZSCCDJrrqmMM+cSh5xsB77Dxp0MLddklRd7nwCwGYIij7CjVLF0vWbVXnwRw9M/+pRfzgW3sGzMeiG05y0IsH7pNFKQeI/NUwRodZvgLetT2jEug59ikP+EOhBKswv7CMyIqe+DanCmMw5aH11KldpSNIDJzLX4eRTC57BDxmJ47P1DiXPAPxrYwrHiaeTNhxil1ZkIGTJ2/XIyfgTq03s87l5ACCo3FQSICfMu0+VXg1infMTAJcL50fXKo7holpMx+wMNMSpuR+iSrjWdf9soQQaVrAZzibOnYXTYKbEofZtC74lJYEFyNSpreJtxEK+FEvPYVTrnuGGIyViamFE1jAcAZmZt0Y7vlbuQJkfL0W1N+TNl/48dQSKFY2SRNXuWxYeAdBMoASk65ZsJytwZRRVr8iQsjAlAgNgb/y5/LCyYR2iYL8Rf5L6UUTvLQ7WpW3xzElYrzwCSvh0oqZNrUHodgFS5g0De8y+zc9Ekxluyf96gMfx+qbrhGQt3I/G3ADa1nhOrF7HkIw==
X-MS-Exchange-AntiSpam-MessageData: 
	HFqQt5VyBpEPCAtJjDBDkm9x63pL7wjEkNu0pFacCR13+lHkMvff8BBud4Za95Xi1RWp4Z9Zvn1eYOhxmBy5CEU28HzNfm0K77KUXv4QpQwXEnRDlFkAHdvrDpNQ8JjEJg8beKBs/K8EPAlaYIMQEA==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218ca206-dbfd-4553-a98f-08d7e65cf344
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2020 01:31:59.1456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyNw6kqN/xNetw2B07VVBLSBDtOkOCAw3YRTOwElwALlCA2LvJXV7jjgIWYWwNQgTft/2OshUsRJYbRMmxS1Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2344
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Excerpts from Bruce Ashfield's message of 2020-04-21 08:33:34 -04:00:
> On Tue, Apr 21, 2020 at 5:37 AM Dan Callaghan
> <dan.callaghan@opengear.com> wrote:
> >
> > We need to copy include/config/auto.conf into ${STAGING_KERNEL_BUILDDIR}
> > to avoid module compilation errors like this:
> >
> >     | make[1]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-source'
> >     | make[2]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-build-artifacts'
> >     |
> >     |   ERROR: Kernel configuration is invalid.
> >     |          include/generated/autoconf.h or include/config/auto.conf are missing.
> >     |          Run 'make oldconfig && make prepare' on kernel src to fix it.
> >     |
> >     | make[2]: *** [build/tmp-glibc/work-shared/machine/kernel-source/Makefile:641: include/config/auto.conf] Error 1
> >
> > We also need scripts/basic/fixdep to avoid errors like this:
> >
> >     | make[1]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-source'
> >     | make[2]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-build-artifacts'
> >     |   CC [M]  build/tmp-glibc/work/vendor-linux/tehuti-module/0.3.6-r0/git/TLK10232_phy_Linux.o
> >     | /bin/sh: scripts/basic/fixdep: No such file or directory
> >     | make[3]: *** [build/tmp-glibc/work-shared/machine/kernel-source/scripts/Makefile.build:303: build/tmp-glibc/work/vendor-linux/tehuti-module/0.3.6-r0/git/TLK10232_phy_Linux.o] Error 127
> >
> > And scripts/mod/modpost to avoid errors like this:
> >
> >     |   Building modules, stage 2.
> >     |   MODPOST 1 modules
> >     | /bin/sh: scripts/mod/modpost: No such file or directory
> >     | make[3]: *** [build/tmp-glibc/work-shared/machine/kernel-source/scripts/Makefile.modpost:92: __modpost] Error 127
> >
> > Most of the time, the absence of these files is masked by the
> > make-mod-scripts recipe's do_configure task, which causes a whole bunch
> > of extra files to be built into ${STAGING_KERNEL_BUILDDIR} (including
> > these two). Typically make-mod-scripts will be built before any kernel
> > modules, and so it didn't matter that do_shared_workdir was missing
> > these files.
> >
> 
> The design is that, make-mod-scripts is what provides those files, we
> don't want to copy them, since it is an ever incomplete list (more so
> in the past, but the concept still holds).

Okay, I think you're saying that what do_shared_workdir claims to do 
(populate ${STAGING_KERNEL_BUILDDIR} with whatever files are needed to 
build kernel modules) should actually be handled by make-mod-scripts 
instead.

Does that mean, do_shared_workdir has no purpose? Or is it doing 
something else I don't realise?

> > However the problem will be evident if you do certain sequences of
> > tasks, for example a complete build first (so that make-mod-scripts is
> > already built), then:
> >
> >     bitbake linux-yocto my-kernel-module -c clean
> >     bitbake my-kernel-module -c install
> 
> Why can't we fix the dependency ? We chased a few of these around when
> the mod-scripts recipe was introduced, and this just looks like a
> variant we missed.

Right, so there *is* already a correct dependency on 
make-mod-scripts:do_compile. The problem is, in the scenario I gave 
above, that task is already done and Bitbake is not going to run it 
again. But in fact, the stuff it left behind in 
${STAGING_KERNEL_BUILDDIR} was cleaned out when I cleaned the 
linux-yocto recipe.

I guess the real issue is that we have this "shared" work directory 
which a bunch of different recipes contribute files to, but can be 
cleaned out by running the "clean" task on any one of several different 
recipes.

-- 
Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>
