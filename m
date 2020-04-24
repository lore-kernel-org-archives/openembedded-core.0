Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com [67.219.246.212])
 by mx.groups.io with SMTP id smtpd.web12.3844.1587689833233222419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 17:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digiinternational.onmicrosoft.com header.s=selector2-digiinternational-onmicrosoft-com header.b=PLkrLYbe;
 spf=pass (domain: digi.com, ip: 67.219.246.212, mailfrom: dan.callaghan@digi.com)
Return-Path: <Dan.Callaghan@digi.com>
Received: from [100.112.3.6] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.us-east-1.aws.symcld.net id 82/77-39899-86932AE5; Fri, 24 Apr 2020 00:57:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRWlGSWpSXmKPExsWSoW+9TjfdclG
  cwesV+hbdOw+wWtz5+Y7dgclj56y77B7nNq5gDGCKYs3MS8qvSGDNOLGmha3gkWDFyWUZDYwz
  +bsYuTgYBZYySzS828oM4RxjkXh5ZTULhLOJUeLczyWMIA6LwBFmifUbHwCVcQJlIiS+3p3AB
  JIQEljMJDF71T1WCOcxo8SHPwvZuxg5OJgF1CXWzxMCaWATMJBYN3cqG4gtIqArMf3dPmaIkj
  iJG0/MQcLCAvESj/ZvYgWxOQUCJd729DBDjFzHJLFo6XWwXhYBVYlde+cygti8Ag4Sv350sID
  YogJiEs9nPgJrZhaQl2jeOhusWUJgKqPEhuvLwIqEgO5ZvfopG0SzoMTJmU/A4hICOhJ/FzVC
  PbCLSWLXgh1QDfUSz57vZoQospY43L2IHcKWlTh6dg5Us6/EnlPd7DCDlnZuh4oXSNxraoCKq
  0nsu3wP7GMJARmJw725EMdtZJZ4PfsX+wRG3VmI8JqF5IdZSE5dwMi8itE0qSgzPaMkNzEzR9
  fQwEDX0NBI11DXyEIvsUo3Sa+0WDc1sbhE11AvsbxYr7gyNzknRS8vtWQTIzCppBQwyuxg3Dj
  /vd4hRkkOJiVR3vfKi+KE+JLyUyozEosz4otKc1KLDzHKcHAoSfDeMwfKCRalpqdWpGXmABMc
  TFqCg0dJhFfZAijNW1yQmFucmQ6ROsVoyTHh5dxFzBzvfi4GkqsOTF/FLMSSl5+XKiXOywPSI
  ADSkFGaBzcOloQvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmLQS5iiczrwRu6yugg5iADm
  rXmg9yUEkiQkqqgcnQICPg8yb1w55525uqtBtNbzHf7vM6UtDH9tdIf8tRsTTfokWxzSEbi/d
  5XYo4ulxSo9HNd/MTs6d7Kn4fFu5R+LI5f/Mhn9Mbyqf2su6M2hytkX3CQ//1hZOv++7uXLmy
  btGiLVeERDXWTb1tEyMrpyr7WEHs3rQzfvNeB5x69W550q07el/zuUQ9zto0KNyMFfBwjGGP1
  ru29Of071dW/GT0jtpqsK2Rm783sGaVWynTdREL1qe//y6bcsX7dIGq5uSeix+XbpBeHv/H9v
  V18edvkq5Omsqa6rb6u1djb84V2wUlUqFM0WEMmUp+21M33PBfc11vpXG+cQfzgVV3av/ETzO
  8deqLyY6dN92VWIozEg21mIuKEwGZrNOhPQQAAA==
X-Env-Sender: Dan.Callaghan@digi.com
X-Msg-Ref: server-33.tower-394.messagelabs.com!1587689831!3705822!1
X-Originating-IP: [104.47.59.174]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8429 invoked from network); 24 Apr 2020 00:57:11 -0000
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) (104.47.59.174)
  by server-33.tower-394.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2020 00:57:11 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKHawo5/r3mmb1sB1F64XdoSA3XVvD7HPlAGy3GDWGogEpNIJijoF5LkGCL0nS9eOoHRw1zFQjJOfhJqhKEAZVVE+ps648h5ze5rhZLcfpDKO0k3EiZL7zTTI9qYkvmFj0veU+U1VSVqPlsCXgCQPOrPlJEPTg5VAbkVb57rqiPXAxGsMOfHLXXcK9H+g3eCKoEuWwmsUMscjN4yUYUln9cdyzCJuablwy+yLUf0+ttONsygDp2+SzbyHayLsEKMh0o7KysE0WA2Gu/G7g9XTDHJAy98lE/QnOMOi636BKpNubSHXFU8Hg9hPeHSerQsfOriCchqUsuLx0LljJTysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFWQsQXlP5QuBs2uoVQMxXS4VPrViYsI/YXhVvNFlOQ=;
 b=VgRi8LHeLBrVITW0wi41GsPP2OHPUrW/H3Jk2YdDH8JF/in4rI47Oi6tNiRSj+qTVjnyWPgxTc75ADSsHgmQTOYuJjydw214JuTRq9lFqIOMWNlWj9cpenogfyLEhP2JhiSxZW9i/POXZGRAFAuNphgVGS7xX00e4SVN6FQZKZh6euejIxYbhaEW8eBdT8HKZf05XNhsTXhId6Z8dLG0M+bFK/pY9rPooRbf0f7h9eEUiv6oeYS1Cb6s62QOzPiRYSrMv4yMxlhXBATzqhUKqE5LJFgYLH6EUVCn0CRXN8IqBttZXsrY54O1w+y/2yTcAzwv5JB7uHZPRaugyR8jPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digiinternational.onmicrosoft.com;
 s=selector2-digiinternational-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFWQsQXlP5QuBs2uoVQMxXS4VPrViYsI/YXhVvNFlOQ=;
 b=PLkrLYbeceXN2Een9pnOL8VtyQdfliA6SVLDUryTWv5qOsFQDHrbQ91vdmhZJbuArFtdBvl5yujRQ1lsBh+j1NTrIM+8cWgtaoEYoLKZsOZNIx2dYQik8keUhBq3c1eAH0iVBC6C22G/sUx8CiHaOigWwfpjcQobj+LTahWI6Rs=
Received: from CY4PR1001MB2118.namprd10.prod.outlook.com
 (2603:10b6:910:40::35) by CY4PR1001MB2165.namprd10.prod.outlook.com
 (2603:10b6:910:42::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Fri, 24 Apr
 2020 00:57:10 +0000
Received: from CY4PR1001MB2118.namprd10.prod.outlook.com
 ([fe80::1de5:5498:680e:db6c]) by CY4PR1001MB2118.namprd10.prod.outlook.com
 ([fe80::1de5:5498:680e:db6c%3]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 00:57:10 +0000
From: "Dan Callaghan" <dan.callaghan@opengear.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: copy some more needed files in do_shared_workdir
In-reply-to: <CADkTA4O8r3geHNUNDNnBpgPp4X6jsQRLRX-pEAWW47XGfYE2Fg@mail.gmail.com>
References: <20200421093732.29192-1-dan.callaghan@opengear.com> <CADkTA4NGkRXf-jmvX9TooAEAr9RiA+0dWr01icYAKkp0yZZPCg@mail.gmail.com> <1587518872-sup-9466@galangal.danc.bne.opengear.com> <160803E330909B82.23462@lists.openembedded.org> <CADkTA4O8r3geHNUNDNnBpgPp4X6jsQRLRX-pEAWW47XGfYE2Fg@mail.gmail.com>
Date: Fri, 24 Apr 2020 10:57:03 +1000
Message-Id: <1587689280-sup-4006@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
X-ClientProxiedBy: SY2PR01CA0006.ausprd01.prod.outlook.com
 (2603:10c6:1:14::18) To CY4PR1001MB2118.namprd10.prod.outlook.com
 (2603:10b6:910:40::35)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from galangal.danc.bne.opengear.com (2001:44b8:21b0:d600:329c:23ff:fef3:d4d4) by SY2PR01CA0006.ausprd01.prod.outlook.com (2603:10c6:1:14::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Fri, 24 Apr 2020 00:57:09 +0000
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)	id 2912540A7FB2; Fri, 24 Apr 2020 10:57:03 +1000 (AEST)
X-Originating-IP: [2001:44b8:21b0:d600:329c:23ff:fef3:d4d4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0edd845f-93f8-4575-caa6-08d7e7ea6aed
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2165:
X-Microsoft-Antispam-PRVS: 
	<CY4PR1001MB216568BB384EBB52D1588B0C90D00@CY4PR1001MB2165.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2118.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39840400004)(376002)(396003)(366004)(346002)(2906002)(426003)(66556008)(5660300002)(66476007)(44832011)(42882007)(186003)(52116002)(66946007)(6916009)(316002)(42186006)(8936002)(966005)(8676002)(4326008)(83170400001)(478600001)(81156014)(6266002);DIR:OUT;SFP:1102;
Received-SPF: None (protection.outlook.com: digi.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0s5jhsT3QlvbwGv9Xm1rEpltSlT+Rfy4UDTj7lD+PejAt9hV5tQnyHPUSsfm7Ghxwr4BS8pcUpnXcO9XHM6CCpCF9IFynpjo/2vRBzhd4aTPLl3yE4L6cqVYT6KAhf8RlyB3rD+WCHvm7m1fnJAZ0idGE+Z/TsEHOJCZjLnU0VllrI5grUL7lQktT4FLr9MVkSnVzvd52r2ZjYkVJuEcdCq5rmYlvNGnGai8+7Aytt0/r+/THGrLtuNF17NCTnDUxUTxltEl/fU/OQfxmf8SlhppkT7CZXj4duL62TSl5/WtwkStPyy/ltixLu7YRF6xHMnorf/crthaXTnv8mJcV1fWbv6IutJQ6hpWiZO6qXrZkS1fzzlHn8qIn89XaP/RN8EK0AEeHJMSkR7flBYKnpPAbD8J2p04FDgw4UIffBkkOO0hgG9N0xX2NAr1mqct2wWnbyzlzROdcWHl1tQ96UF8A72CUuWIKU/fhAoA0RrIJ6ZORW3E2pOYb0sK/fEWSnWH8LYhwKyzLdTMqSSCdQ==
X-MS-Exchange-AntiSpam-MessageData: 
	BrSX6nY2aOIysGPOZOoR+oqrYKgAKd4q5kM1Z3l0iAmkMzsJ+oMou+nnyLLVjsSAvnFgYt+9SR1juiw+eSI2PIURP+5SnZ7ljZ/YI2wtGpVirtssqQThPVDRaTrZ446pFD1FtZLoppihrklDqvFOpS3F5ctcNM4SmS0VwSj8kya9r20gbqHd5f5lHC5QaSqIGqfspv1uZr+xuczVuS+hvg==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edd845f-93f8-4575-caa6-08d7e7ea6aed
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 00:57:10.2154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiSfeKF65/5ONYKqWZyuxzJnSGg8ThKiTZeo3pHUGOELBFxO5OdCe4ooR35akHPmv+rYepBfFzZCzjvwr2sEEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2165
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Excerpts from Bruce Ashfield's message of 2020-04-22 13:40:33 -04:00:
> Are you seeing this on master, or some other branch ?

Unfortunately we are still on Warrior, and I can't easily test any newer 
branches right now.

> I can run the following on master, as often as I like:
> 
> % bitbake linux-yocto hello-mod -c clean; bitbake hello-mod -c install
> 
> And I see the required scripts coming and going from the build
> artifacts as expected:
> 
> build [/home/bruc...-artifacts]> find . -name 'fixdep'
> ./tools/objtool/fixdep
> ./scripts/basic/fixdep
> 
> # after the clean:
> build [/home/bruc...-artifacts]> find . -name 'fixdep'
> 
> # after the install
> build [/home/bruc...-artifacts]> cd ..
> build [/home/bruc...qemux86-64]> cd -
> /home/bruce/poky/build/tmp/work-shared/qemux86-64/kernel-build-artifacts
> build [/home/bruc...-artifacts]> find . -name 'fixdep'
> ./tools/objtool/fixdep
> ./scripts/basic/fixdep

Okay, that's interesting. Thanks for testing it.

When you do install on the module, does Bitbake somehow know it must 
also re-run make-mod-scripts:do_compile, or is fixdep getting put into 
the kernel-build-artifacts directory by something else?

> Is there something different with your module recipe than the one in
> meta-skeleton ? Can you share it, so I can debug further ?

We see this with all our out-of-tree kernel module recipes and they are 
all pretty ordinary, just using module.bbclass. Maybe there is something 
strange we have done with our kernel recipe which is causing it.

I can't share the entire layer but here is an example of one of the 
module recipes:

https://gist.github.com/danc86/09143b04f43e47f99ae91bbdee53bf2f

I'll just paste the entire thing here too since it is so short:

SUMMARY = "nct5104d watchdog driver"
DESCRIPTION = "Linux driver for NCT5104D watchdog function"
HOMEPAGE = "https://github.com/opengear/nct5104d-watchdog-driver"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
SRC_URI = "git://github.com/opengear/nct5104d-watchdog-driver.git;protocol=https;"
SRCREV = "5495f4eaa15bb0b8804778df046f5276d66413ce"
PR = "r1"
S = "${WORKDIR}/git"

inherit module

-- 
Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>
