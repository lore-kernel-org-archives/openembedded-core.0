Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.263.1793943728577605217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 21:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AZIqCTSo;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=27923; q=dns/txt;
  s=iport01; t=1793943728; x=1795153328;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=vmoyQ+8o5ziwn2rYBy19Kea1ym6x7gnZmsjhx1RLtg4=;
  b=AZIqCTSo9zIUUvV8tQN3ztMnafD7QW+q/pog6ziW+71tsjwsXBZMtfpM
   0RoXHSOAJsiyUKyqLuLWAeEntsLfDW+mz84mnQTFjVrmpdYWtVefduDDL
   4K3jy4FT5/7iqk71m28lfMfaZ5y8YtBDRY4QYd0KI5j6QoSXkybo8m4Q2
   0uoY17Z0cHn9xOF3eKLpuY1Pxgi8G/TC8Urv1ubIQ40R53UW8fBgUbOL+
   5mBRlOH21B2P1/OCDGp/Z+XTPiXmf5FtnfBTJucmFeE+Rej3vwo3N2boM
   dwt4X0tEccxQdIZSD3dsrGGVfftGD8qsGZczdLMuwiSPOeWC7pBpY8mVc
   w==;
X-CSE-ConnectionGUID: CMJgvIk9Q16KjUNdH5OC1A==
X-CSE-MsgGUID: 7lIt2FY/TOWZkKwkGGHCSA==
X-IPAS-Result: =?us-ascii?q?A0C2AwCHZ+1q/4sQJK1agS6BK4E9MVOBCQKBERIaL4gjA?=
 =?us-ascii?q?4UrhlmCIQORTIxVgX4PAQEBDQIuARsHBAEBhQUCjh0CJjQJDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAQEBAwERdwIBCBEEAQEBI?=
 =?us-ascii?q?A4nCh0IAgQBEggMDoJhgh0WQQMBAg4GsHZzAoodeIE0gQGDYwHcWRWBOIMRg?=
 =?us-ascii?q?XU6gwMbAQErSWyCXYEjNIRiJxsbgXKBV4JpPoJhAQECAReBHSuEFIIwBIINF?=
 =?us-ascii?q?XoSG4JCCYIZgxuGWAEBgVFbhh5SciIDJjMsAVUTFwsHBYElEDMDIAovLQIUD?=
 =?us-ascii?q?RASDwQWBS0dcAwnEg8dFxEeWBsGBRIgKkFDMCuBEoEHXYErKF4CH0YtFYF2A?=
 =?us-ascii?q?oJRgSNdAgFJQQ4HRVMJFg8+BRJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgUaR?=
 =?us-ascii?q?wgCCwIMdCgREBMdHiQvBRwmPhsKL209NwYPGQMEgTUFkVEHW4IfAS1FWjQBK?=
 =?us-ascii?q?wQeLYEWVg8EEBmSagEJj09HozIKKIN4jCSNPogyF4QEgVeLPQSZVZkII41nl?=
 =?us-ascii?q?WECBhsWhHUCBAIEBQIQAQEGgWg8gVlwFTuCZwkKQBkPji4Wg2CFE8ceeQIBC?=
 =?us-ascii?q?DICBwIHDgMLkWiBfgEB?=
IronPort-PHdr: A9a23:O07IFxKDhQKh8l0pS9mcuVQyDhhOgF28FgcR7pxijKpBbeH6uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:B7AtIqAD+cOhnBVW/3Hiw5YqxClBgxIJ4kV8jS/XYbTApD530zUBy
 DEdUTzQPP/YYTGgf94la42zpk8AvJKHyNNgOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE6NBMA18XPtwho7hUA1xo+
 dxFDxtUR0XW7w626OrTpuhEj8AnKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxAMmsHgBfoO3WjPn8XFJI3n+6yrnL+aDZf7lmSoMLb5kCDnVQugeK0YIC9ltqiGsF0ghy2l
 yX62FvLATIFN/Ow6RG+2yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNuhoaHt4VGOog5UTVkOzf4h2SAS4PSTsphMEaifLajAcCj
 zeht9joHjdo9raSTBqgGn288WLa1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:7dC4GKsP4LeiUP3Pl/qyCZUU7skCf4Aji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwR5VoIUmxyXcH2/huAV7CZnirhILGFvAY0WKP+UyFJ8S6zJ8g6U
 4CSdkwNDSTNykBsS+S2mDReLhQoqjjzEnrv5ai854Hd3ANV0gU1XYANu/tKDwOeOApP+tfKL
 OsouB8i36Lf3MRYs6nBn8DcdTiirTw/q7OUFotPTJizBOBow+JxdfBfiSw71MzQjlPybAt/S
 z/lRDl5qKsive/yhXN/W7e5ZZblbLau5V+7cq35fQ9G3HJsEKFdY5hU7qNsHQeu+e08msnl9
 HKvlMJI9lzw2m5RBD0nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxri7VY6tt0U6t
 MJ44vZjesUMfrzplW42zH6bWAsqqNymwtlrQcntQ0bbWLZUs4JkWVQxjIMLH5KJlOK1GluKp
 gfMCib3ocWTXqqK1bEo2Jo3NugGl43HhuAXww+n/b96UkMoJi8pHFomfD2WRw7hcgAo5Uo3Z
 W2Do140L5JVcMYdqR7GaMIRta2EHXERVbWPHuVOkmPLtBNB5vhke+/3FwO3pDjRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo8ERgMyweJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR/vuN3HnF4pF1xD3H5NSNX4dWssIvctTYSPFnuvbbonx8uDLevfaI7TgVT4iR2PkG3
 MGGCP+Ic1Rh3rbLEMQQCKhLE8FVnaPia6YSpKqjdT74LJ9Q7Fxjg==
X-Talos-CUID: 9a23:Q4MtD2GJTHpejfjkqmJM0WwbBOEmI0SEklTSHmm0KTtOY+S8HAo=
X-Talos-MUID: 9a23:X+FiOgswSBmVqscnD82n2zVDKJ1G0uOSL38/krYZuOarFQdLEmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 05:42:04 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 9982C1800015D
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 05:42:04 +0000 (GMT)
X-CSE-ConnectionGUID: /+EVQN6LTeOazeydZSPEYw==
X-CSE-MsgGUID: sI30WiowTyGn2bkepjzn/g==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208,217";a="91829642"
Received: from mail-centralusazon11011009.outbound.protection.outlook.com (HELO DM5PR21CU001.outbound.protection.outlook.com) ([52.101.62.9])
  by alln-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 05:42:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytfGi5Uj+L65Tmlgaol8gWNOztlPtd/9K5KsyoxtUwIU/rirycz8YfaVaojWSV/dZXdaby+FxfHAXKlH98OOVGLttlT3IsWTe551VVNZnJJkQ3QLmJJRJyfSCuZfg1jBfNTVfaGyRtxo6bLQgPayTWR6cTu+NOXbrVihQwaxRCvKIBS1hHqDUOyH+YeqHUXjyHar1tFFCs+uIag6+wxcpBOyKNzb9C7NHHbscbj/gf6ZRgF/TWUKpy8h3NIST3Ga/91TFPM5vLMGXKIDjR2uclghsJed0iazF9abZZFyfNcpzqTJ7G8YCLhW8LvtevsPhVO36E7g8NCOcEF2ZwxCfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmoyQ+8o5ziwn2rYBy19Kea1ym6x7gnZmsjhx1RLtg4=;
 b=nAxdUzxkBcG9K+OEDolOD+qm6E9C18L908EdAJly7LGij1EDVLYME0bcsic7ND2hfXO4TaaYVKWR64hCwoVdm8CW6aWbaeWRAE0MxsAxHe+7BIL2fapPfEUgKPaxCtUkD3pZ7vuz9y02qFGEqhlt6fkQ4jteX++GMmv1jpxHIZB0N3Jn/fQ9Lhf35CsTLqcVsZS+LXGqxN6yDTar2dsOM/jhVd58sYfSQIhNnucf/EqrSiEgCgVQWaE8fCEJmXm3cYyyrpzmcG4SuQAGgkvdhst6X4OswJ6gZ9NIMJBwKiEFWZpu91MGRnfAB4kI8D4MS2CrdlQ8wcEQFN9vdgSonw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 05:39:24 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%5]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 05:39:24 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>, "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE
 LIMITED at Cisco)" <hthakar@cisco.com>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from
 u-boot
Thread-Topic: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from
 u-boot
Thread-Index: AQHdS4frhCCAqvcIU0uOsV0baGdy0rb/TigAgAa+x6qADNOVgIAADuXdgAAPoQCACRMmMoAAQGkAgAHBWFOAArbxHA==
Date: Fri, 6 Nov 2026 05:39:24 +0000
Message-ID: <PH7PR11MB8598F59AC850E4825FC3FF10AD762@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20260923173850.21338-1-peter.marko@siemens.com>
 <DM5RBD9MJT2O.2M12R8AMW5OLY@smile.fr>
 <PH7PR11MB8598B39DBADCDF5C628594DDAD672@PH7PR11MB8598.namprd11.prod.outlook.com>
 <DMGCPPR45G7N.2FMNA6HS4W3G6@smile.fr>
 <PH7PR11MB85983BF338795A95B47297DEAD6F2@PH7PR11MB8598.namprd11.prod.outlook.com>
 <DMGF1CY7LWZQ.3N9SFE4FLRK56@smile.fr>
 <PH7PR11MB859851658A7D586768D2A604AD692@PH7PR11MB8598.namprd11.prod.outlook.com>
 <DMLGS7DZ86PF.3RG2UJSCTM4TV@smile.fr>
 <18E4D66BDEA889BA.304946@lists.openembedded.org>
In-Reply-To: <18E4D66BDEA889BA.304946@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|PH7PR11MB5862:EE_
x-ms-office365-filtering-correlation-id: 9998d9fe-4236-4569-4513-08df3bc850fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|11063799006|4143699003|56012099006|261022113327099003|261022105027099003|261021135927099003|261021123027099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|10067099003|22082099003|18002099003|6133799003|8096899003|13003099007;
x-microsoft-antispam-message-info: wQ66MP6Cv/bu04ouTm7Vfu0rl3IsiuJ4mfnPlptG//jqmuxgRSOmO6dJQAkhsRtszFvgbca8xlWubGuJ6qpORwfLcM7Kk7yC44jttjfe4cvE02//1NAgtT9BD4RLyUsoqsUwdbYmMG6Ot95DFWDA/sEd2NOjb0hgiQ4Ofrnim2lV0O9TI3hoOg2858s/7XbJ2EEdrEktmXOJkXMOLWnZkgSADFjWNRk4YOREaq6kKqCnpMENXeRKjb3S0er4gZ/mfpBcRS0WN2Lg1E1Ze30orsz5QEPZAmt7N/qfV+9DdUvMXJGaQmRsqmDNEmxXF5B7a4YGfM8ZK7/Whb3ADsfOJGylKjpgLEpS5rlf/yUeAffaFd7uG8oWdK0NWPwATm+jBA3FtSwD3hT24ahvQqkprYxiFKPkasrnRvU46zPmcqPi303A+X8syxJhv1I3VKYAs9wAb9jI7VccbQDaM9b8GeZvC919bIrOjdfdszZFmFANsKpNwU7zqKDjmuzRV8LMNRZKuRnRblFzUe1NGBYRWfduRMJ6Wr+ruwL4qVW1Bx5veUIfQezqcVmDZrmydQaLDarWjwoeKJchoSjZ1qdohwqS/ZuHuHpKAlfv/Braf4Vr77BO792ntPMeVBEzApZUisn4YylT4fIB/b4w5loJnC/ezEE/Fb0QnDMrAKlk/1m8fSc3YmX12a+dARM8L9gQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(11063799006)(4143699003)(56012099006)(261022113327099003)(261022105027099003)(261021135927099003)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003)(8096899003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?LSswJ9onPYLNoxPWYeRrH7EVazJJgjHT9yedPsiRnI+aUQC+Fhh3PS8j?=
 =?Windows-1252?Q?/ASclga/gcFx9pCVuXc1ZLSeXTm/MelCs40tr/zGcCeRlV7JCftkEVLz?=
 =?Windows-1252?Q?Tay4VWtPKqtJDjboHZ0w/w4+TR2LD76c1l50PtRcjRjVHPC1MR37n3wA?=
 =?Windows-1252?Q?ZbF4EOEoHTZ+Y1yVPVFfGIXK9Hdr7m/MNWwmEQlv5zdWjXqnn7+DM/T/?=
 =?Windows-1252?Q?v1/Tlf9Acrl6U69WwFRBgHvulqqeLc5Li6jstp5S056/JU0Z4ukRP8GA?=
 =?Windows-1252?Q?EoI7ficijvkrhjhndGW6dIMHXD2C3zAfTucrlEv1xYC7GTmgB9Gg1WHB?=
 =?Windows-1252?Q?Ua0PRK5I5vMkYjC2fGwXVktPjfV4WgsUvssLDh7fWL58EVO8ivTC9vdu?=
 =?Windows-1252?Q?gRM1jq93Xy3HY5oLMW4vCE+7KfMTNSNS5cCrlDItZS7Ui+SlRcROIOyx?=
 =?Windows-1252?Q?jLKZlzfK4Jt+E3uof7z++tJBqe8h3+L+yHtHRE3/BvHTOA4jPmNZW300?=
 =?Windows-1252?Q?D7vpK+SuMEdWtx0N7KBiYM3pFU7ttV9z8c0sOD+vK1bgQGOpJDrt44QN?=
 =?Windows-1252?Q?4mGtkmAQdoxfsb2M4VmVnVPxrfrfzoYvnhJ285+/2v8+Be3J5SlN11Vz?=
 =?Windows-1252?Q?vW3CMbmXRkwBvpXF0LI54oXFnalfStsNt88FSKNQYUaeFUuov83Gd7jH?=
 =?Windows-1252?Q?P5lds8fk9aL3hbu5bbxYOkyOkWn9AR6B/p5e4gogxJ3QvvYAfMx2RcXU?=
 =?Windows-1252?Q?YWPpfcnaBa/nSum9Yr/rD3HWAM81P1zS/IjW41I/J/CZzyDTmCLOHqpZ?=
 =?Windows-1252?Q?H1sUP722dteOxFKoSJ2xrU79KWHgosQdB8wD9WLQKA32a6ytnH10V5Zy?=
 =?Windows-1252?Q?l24HVvar5+agqM/U0Vln5wkWofXHVWKY3rv/J+IVXqe8psWrR9dbPHfk?=
 =?Windows-1252?Q?rJJ03Yif38/sL300fG2jHX20Jn+0B4OYJvaAegoHeVgFDYQt7N3EoQ2e?=
 =?Windows-1252?Q?COBcKDCqEumZbEEgtB5tbHC3TZwo0RZy11H10Hw+Cs92f4UH2qfnh/nF?=
 =?Windows-1252?Q?UE0LGtcm87/i+y0BGirqSnNf5tmTv9CFJNe5+Zk3Ep3tD1glOM6Lzt1U?=
 =?Windows-1252?Q?XvNlhmb5RsPtzfPMRkUegCiuV/EhYoMzS2lRTQN+nwJ5X+9nwKL6Z7Uj?=
 =?Windows-1252?Q?E1JYB5T+JmhrQM7c+k+t+GqOpLO0LLuKCAVCM7ZIbLXDi+MSPDzmmIFZ?=
 =?Windows-1252?Q?4c8y0v8uRX1Cz3D+ag4ksfx9DVU2phou8s5OH5yVLnFBmdETQSp3dcXn?=
 =?Windows-1252?Q?zhuLEMIYB+rG3VBzTEaG5Rn0XGvtuke71RBZdOqAtWQnp/ya9/B04GEl?=
 =?Windows-1252?Q?JqT8sBO1yWdxcaEg/aIqW5Un8vlJFr8q/k2rFNzXP/F+PXXT5AJY7SqR?=
 =?Windows-1252?Q?SOHL1w7yAq3kWrRS4oTxWV4KX/TEA7g8gccMir6GEeGGNXNkNprqLfD4?=
 =?Windows-1252?Q?BQ24XtlxaOjK1R5RXn3GJ0Ssjv35gys7fmbbT5Re2TRqgZVnKKrOvYrB?=
 =?Windows-1252?Q?2Bi8cuM0SNj6vK9vkj5txtzGMyrDkreJ8eLaw1MsMpW5OEU+ZIqojebB?=
 =?Windows-1252?Q?0f5c0+s1h5B7VZDvPFZSbSJqaVEYIz19sSW90ZxtwddLcJpdJohQ3ROd?=
 =?Windows-1252?Q?GpwQJiz7HhPHA/ISF0BrqNWY4qo+90hzaLK8zvg7HWlJ9xu+/zkV6m5y?=
 =?Windows-1252?Q?GaR9QrO5Q4VpQd+PrFXdj8TCORAaZr05Gfn/EyUXQpDOmC12T/oqauY4?=
 =?Windows-1252?Q?hprLg63nUc/rqFL2uIVxgPAhtPQj/EYLB5ep6hx7o4ldjMbA?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB8598F59AC850E4825FC3FF10AD762PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FPlo8mJorSXKknmZ1tvZfs38zA8n0EoMGjit+dWZPT0Jv6oM4X16Lz1lSnsser42bs5DkJeoB/jOiTLsiqtLrnf+2/RBwSDzgf7x5kx61lQo/P93d82ETskKLN15olbK3NwMhWt4DPkX8TVRjF7UqRxTigxnmPpZhYLr1+akgD7NkLOYyNSU3T218HFjwde4//Ng+I66SdzOpm2Ve3Rq5ZJ1u4cN31FjHjQQ6/Wf8LznaiZpj6pmUtPxgF9AJEUZvLQsHHVgd5IRZCYECphqQGxDCOgH3R6715h3tM1z7zPuuRjsYBaJ1l4ic9cMMy8degxzuQYo/v4HiodGUDfonw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9998d9fe-4236-4569-4513-08df3bc850fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 05:39:24.7549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uyqytu9PPqONig2COFuwzYCtBVIGH4T6KY51GKppCGnp4Lxo/2R7uuUpvwlgfLQVkwg2Lcm/jy3ALeP/fKPasw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-1.cisco.com [173.37.147.229];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 05:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249584

--_000_PH7PR11MB8598F59AC850E4825FC3FF10AD762PH7PR11MB8598namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Any updates on this ?

Regards,
Hetvi



________________________________
From: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) via =
openembedded-core <hthakar=3Dcisco.com@lists.openembedded.org>
Sent: Wednesday, November 04, 2026 17:41
To: peter.marko@siemens.com <peter.marko@siemens.com>; openembedded-core@li=
sts.openembedded.org <openembedded-core@lists.openembedded.org>; yoann.cong=
al@smile.fr <yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches fro=
m u-boot

Hi Yoann,
I will prepare and submit the updated patch as discussed.
Could you also please confirm whether we need to revert all the earlier pat=
ches proposed by Peter, as discussed in the thread below?
https://lists.openembedded.org/g/openembedded-core/topic/121397520
Regards,
Hetvi

________________________________
From: Yoann Congal via openembedded-core <yoann.congal=3Dsmile.fr@lists.ope=
nembedded.org>
Sent: Tuesday, November 03, 2026 14:52
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openembed=
ded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches fro=
m u-boot

On Tue Nov 3, 2026 at 6:33 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS P=
RIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> My reason for adding CVE_STATUS for is that u-boot-tools uses
> tools-only_defconfig, which disables networking. The affected TCP and
> NFS code is therefore not compiled into the tools.
> not-applicable-config accurately describes this configuration.
>
> I understand the preference for sharing source patches between u-boot
> and u-boot-tools. However, the tools remain unaffected by these CVEs
> regardless of whether the source fixes are applied, so I believe the
> configuration exclusions are technically valid.
>
> The same approach is already used in the wrynose branch [1], which
> excludes all three CVEs. The fix for CVE-2026-29009 was also applied
> separately to u-boot on wrynose [2].
> Additionally, For CVE-2026-29007 and CVE-2026-29008, I have not
> located a merged upstream fix or a formal patch submission for either
> CVE in the U-Boot community.
>
> For these reasons, I believe retaining the CVE_STATUS entries is
> appropriate for u-boot-tools on Scarthgap. They accurately reflect the
> configuration being built and keep the CVE assessment consistent with
> the approach already accepted for Wrynose.

The new proposed approach would have to be deployed on wrynose as well
(if applicable, I have not checked).

I think that having the precise reason for a non-applicable CVE is not
worth doing the CVE work twice (once with a patch, once with the
CVE_STATUS). If we can fix both u-boot/u-boot-tools with a single patch
it's more efficient.

I still think we should merge the sources (upstream+patches) between
u-boot/u-boot-tools and fix the CVEs only once if possible.

>
> [1] https://github.com/openembedded/openembedded-core/blob/wrynose/meta/r=
ecipes-bsp/u-boot/u-boot-tools_2026.01.bb
> [2] https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&id=
=3Ddff41dcd5e54cad46ba91ecc45faefb0c8db9089
>
> Regards,
> Hetvi
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: 28 October 2026 16:26
> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hth=
akar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openemb=
edded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org=
>
> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches f=
rom u-boot
>
> On Wed Oct 28, 2026 at 11:04 AM CET, Hetvi Thakar -X (hthakar - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:
>> Hi Yoann,
>>
>> Thanks for clarifying. For patches 9=9611, I understand that source
>> fixes are preferred. However, networking is disabled in u-boot-tools,
>> so building it would not compile or exercise the affected code. How
>> should these fixes be verified?
>
> By sharing the sources with u-boot which will compile those parts.
>
>>
>> Regards,
>> Hetvi
>>
>> ________________________________
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoa=
nn.congal=3Dsmile.fr@lists.openembedded.org>
>> Sent: 28 October 2026 14:37
>> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <ht=
hakar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openem=
bedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.or=
g>
>> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches =
from u-boot
>>
>> On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi Thakar -X (hthakar - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
>>> Hi Yoann, Peter,
>>>
>>> Thanks, Yoann. Continuing the discussion here as suggested.
>>>
>>> As i explained in the other thread [1], the existing u-boot fixes are
>>> not currently applied to u-boot-tools. My CVE_STATUS changes address
>>> cases where the affected code is not compiled into the tools build.
>>>
>>> I understand that the proposed separate include would allow both
>>> recipes to share the CVE patches without adding them to
>>> u-boot-common.inc and affecting downstream users.
>>>
>>> My concern is whether we need this additional include and shared patch
>>> list for cases that can be handled through recipe-specific CVE_STATUS
>>> entries. Could we consider the held exclusions on that basis?
>>>
>>> If maintaining one shared source patch set is the preferred approach,
>>> could you clarify how we should handle patches 2=9611 of my series?
>>> Should we revisit them after the shared include is settled and retain
>>> only the exclusions still needed?
>>
>> The general idea is that by sharing CVE patches with the main u-boot
>> recipe, CVE would be also "fixed" in u-boot-tools (even if said patch is
>> not compiled).
>>
>> For 2-8, patches are in u-boot so no need to ignore them:
>> * [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040
>> * [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254
>> * [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255
>> * [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256
>> * [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257
>> * [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258
>> * [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259
>>
>> For 9-11, there are no u-boot patches so ignoring them in the
>> u-boot-tools recipe, would be fair (but patching them would be
>> preferable):
>> * [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007
>> * [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008
>> * [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009
>>
>> Regards,
>>
>>>
>>> [1] https://lists.openembedded.org/g/openembedded-core/message/247868
>>>
>>> Regards,
>>> Hetvi
>>> ________________________________
>>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yo=
ann.congal=3Dsmile.fr@lists.openembedded.org>
>>> Sent: 16 October 2026 03:44
>>> To: peter.marko@siemens.com <peter.marko@siemens.com>; openembedded-cor=
e@lists.openembedded.org <openembedded-core@lists.openembedded.org>
>>> Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <h=
thakar@cisco.com>
>>> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches=
 from u-boot
>>>
>>> On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openembedded=
.org wrote:
>>>> From: Peter Marko <peter.marko@siemens.com>
>>>>
>>>> After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs
>>>> patched in u-boot showed-up in CVE reports for u-boot-tools.
>>>>
>>>> It does not make much sense to share git repository but not share all
>>>> patches on top of it, so move adding all patches from u-boot recipe to=
 a
>>>> common include file where also the git repository is defined.
>>>>
>>>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>>> ---
>>>>  meta/recipes-bsp/u-boot/u-boot-common.inc       | 10 ++++++++++
>>>>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |  2 --
>>>>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb       | 12 ------------
>>>>  3 files changed, 10 insertions(+), 14 deletions(-)
>>>
>>> Hello Peter, Hetvi,
>>>
>>> There is a bit of back-and-forth around u-boot-common.inc. So I thought=
 I
>>> would give my vision and get your thoughts.
>>>
>>> Fundamentally, there is confusion about the usage of this .inc file:
>>> * This is the common part of u-boot and u-boot-tools recipes (what the
>>>   above patch uses)
>>> * But, also, this may be used by downstream layers to reuse u-boot
>>>   recipe parts. We basically did the revert of Peter's patch a few mont=
h
>>>   ago for this reason[0].
>>>
>>> With Paul, we would like to have a single set of patches common for bot=
h
>>> u-boot and u-boot-tools, but that can't be in u-boot-common.inc as ther=
e
>>> is a risk of breaking downstream layers.
>>>
>>> Our idea is to create a new inc file "u-boot-common-patches.inc" (I'm
>>> not attached to the name) that contains only SRC_URI +=3D "CVE_*.patch"
>>> and a big warning explaining that is file is only supposed to be
>>> included from layer-local recipes (namely u-boot and u-boot-tools).
>>>
>>> This whole situation is not ideal but think the above would solve our
>>> issues and still be acceptable under stable policy.
>>>
>>> What do you think?
>>>
>>> Regards,
>>>
>>> [0]: u-boot: move CVE patches out of the common .inc file - openembedde=
d-core - OpenEmbedded Core layer
>>>      https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8=
ff03147dd532a88cf3ce08d61fab057522
>>> --
>>> Yoann Congal
>>> Smile ECS
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>
>
> --
> Yoann Congal
> Smile ECS


--
Yoann Congal
Smile ECS


--_000_PH7PR11MB8598F59AC850E4825FC3FF10AD762PH7PR11MB8598namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Any updates on this ?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hetvi</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) via openembedded-core &lt;hthakar=3Dcisco.com@lists.openembedded.org&gt;=
<br>
<b>Sent:</b> Wednesday, November 04, 2026 17:41<br>
<b>To:</b> peter.marko@siemens.com &lt;peter.marko@siemens.com&gt;; openemb=
edded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.=
org&gt;; yoann.congal@smile.fr &lt;yoann.congal@smile.fr&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patc=
hes from u-boot
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em; font-fam=
ily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sa=
ns-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em; font-fam=
ily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sa=
ns-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I will prepare and submit the updated patch as discussed.</div>
<div class=3D"elementToProof" style=3D"direction: ltr; margin-top: 1em; mar=
gin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServic=
e, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Could you also please confirm whether we need to revert all the earlier pat=
ches proposed by Peter, as discussed in the thread below?</div>
<div style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em; font-fam=
ily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sa=
ns-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/1213975=
20" id=3D"OWA281d8c2f-c4b6-4f3e-245d-ab2444d191cd" class=3D"x_OWAAutoLink" =
data-auth=3D"NotApplicable" data-rich-text-autolink=3D"">https://lists.open=
embedded.org/g/openembedded-core/topic/121397520</a></div>
<div style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em; font-fam=
ily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sa=
ns-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Hetvi</div>
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal via openembedded-core &lt;yoann.congal=3Dsmile.fr=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, November 03, 2026 14:52<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; peter.marko@siemens.com &lt;peter.marko@siemens=
.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@li=
sts.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patc=
hes from u-boot</div>
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">On Tue Nov 3, 2026 at 6:33 =
AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) wr=
ote:<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; My reason for adding CVE_STATUS for is that u-boot-tools uses<br>
&gt; tools-only_defconfig, which disables networking. The affected TCP and<=
br>
&gt; NFS code is therefore not compiled into the tools.<br>
&gt; not-applicable-config accurately describes this configuration.<br>
&gt;<br>
&gt; I understand the preference for sharing source patches between u-boot<=
br>
&gt; and u-boot-tools. However, the tools remain unaffected by these CVEs<b=
r>
&gt; regardless of whether the source fixes are applied, so I believe the<b=
r>
&gt; configuration exclusions are technically valid.<br>
&gt;<br>
&gt; The same approach is already used in the wrynose branch [1], which<br>
&gt; excludes all three CVEs. The fix for CVE-2026-29009 was also applied<b=
r>
&gt; separately to u-boot on wrynose [2].<br>
&gt; Additionally, For CVE-2026-29007 and CVE-2026-29008, I have not<br>
&gt; located a merged upstream fix or a formal patch submission for either<=
br>
&gt; CVE in the U-Boot community.<br>
&gt;<br>
&gt; For these reasons, I believe retaining the CVE_STATUS entries is<br>
&gt; appropriate for u-boot-tools on Scarthgap. They accurately reflect the=
<br>
&gt; configuration being built and keep the CVE assessment consistent with<=
br>
&gt; the approach already accepted for Wrynose.<br>
<br>
The new proposed approach would have to be deployed on wrynose as well<br>
(if applicable, I have not checked).<br>
<br>
I think that having the precise reason for a non-applicable CVE is not<br>
worth doing the CVE work twice (once with a patch, once with the<br>
CVE_STATUS). If we can fix both u-boot/u-boot-tools with a single patch<br>
it's more efficient.<br>
<br>
I still think we should merge the sources (upstream+patches) between<br>
u-boot/u-boot-tools and fix the CVEs only once if possible.<br>
<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/openembedded/openembedded-core/blob/=
wrynose/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb" id=3D"OWAe13f89e1-=
7e3e-4c57-74a1-2d71864aa21a" class=3D"x_OWAAutoLink" data-auth=3D"NotApplic=
able">
https://github.com/openembedded/openembedded-core/blob/wrynose/meta/recipes=
-bsp/u-boot/u-boot-tools_2026.01.bb</a><br>
&gt; [2] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?=
h=3Dwrynose&amp;id=3Ddff41dcd5e54cad46ba91ecc45faefb0c8db9089" id=3D"OWAc45=
3587e-ace3-d1a5-d809-7eb20eed738e" class=3D"x_OWAAutoLink" data-auth=3D"Not=
Applicable">
https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&amp;id=
=3Ddff41dcd5e54cad46ba91ecc45faefb0c8db9089</a><br>
&gt;<br>
&gt; Regards,<br>
&gt; Hetvi<br>
&gt; ________________________________<br>
&gt; From: Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
&gt; Sent: 28 October 2026 16:26<br>
&gt; To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) &=
lt;hthakar@cisco.com&gt;; peter.marko@siemens.com &lt;peter.marko@siemens.c=
om&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@list=
s.openembedded.org&gt;<br>
&gt; Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patche=
s from u-boot<br>
&gt;<br>
&gt; On Wed Oct 28, 2026 at 11:04 AM CET, Hetvi Thakar -X (hthakar - E INFO=
CHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt;&gt; Hi Yoann,<br>
&gt;&gt;<br>
&gt;&gt; Thanks for clarifying. For patches 9=9611, I understand that sourc=
e<br>
&gt;&gt; fixes are preferred. However, networking is disabled in u-boot-too=
ls,<br>
&gt;&gt; so building it would not compile or exercise the affected code. Ho=
w<br>
&gt;&gt; should these fixes be verified?<br>
&gt;<br>
&gt; By sharing the sources with u-boot which will compile those parts.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Hetvi<br>
&gt;&gt;<br>
&gt;&gt; ________________________________<br>
&gt;&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-co=
re@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembed=
ded.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
&gt;&gt; Sent: 28 October 2026 14:37<br>
&gt;&gt; To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) &lt;hthakar@cisco.com&gt;; peter.marko@siemens.com &lt;peter.marko@sieme=
ns.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@=
lists.openembedded.org&gt;<br>
&gt;&gt; Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all pa=
tches from u-boot<br>
&gt;&gt;<br>
&gt;&gt; On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi Thakar -X (hthakar - E =
INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt;&gt;&gt; Hi Yoann, Peter,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks, Yoann. Continuing the discussion here as suggested.<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; As i explained in the other thread [1], the existing u-boot fi=
xes are<br>
&gt;&gt;&gt; not currently applied to u-boot-tools. My CVE_STATUS changes a=
ddress<br>
&gt;&gt;&gt; cases where the affected code is not compiled into the tools b=
uild.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I understand that the proposed separate include would allow bo=
th<br>
&gt;&gt;&gt; recipes to share the CVE patches without adding them to<br>
&gt;&gt;&gt; u-boot-common.inc and affecting downstream users.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; My concern is whether we need this additional include and shar=
ed patch<br>
&gt;&gt;&gt; list for cases that can be handled through recipe-specific CVE=
_STATUS<br>
&gt;&gt;&gt; entries. Could we consider the held exclusions on that basis?<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; If maintaining one shared source patch set is the preferred ap=
proach,<br>
&gt;&gt;&gt; could you clarify how we should handle patches 2=9611 of my se=
ries?<br>
&gt;&gt;&gt; Should we revisit them after the shared include is settled and=
 retain<br>
&gt;&gt;&gt; only the exclusions still needed?<br>
&gt;&gt;<br>
&gt;&gt; The general idea is that by sharing CVE patches with the main u-bo=
ot<br>
&gt;&gt; recipe, CVE would be also &quot;fixed&quot; in u-boot-tools (even =
if said patch is<br>
&gt;&gt; not compiled).<br>
&gt;&gt;<br>
&gt;&gt; For 2-8, patches are in u-boot so no need to ignore them:<br>
&gt;&gt; * [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040<br>
&gt;&gt; * [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254<br>
&gt;&gt; * [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255<br>
&gt;&gt; * [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256<br>
&gt;&gt; * [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257<br>
&gt;&gt; * [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258<br>
&gt;&gt; * [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259<br>
&gt;&gt;<br>
&gt;&gt; For 9-11, there are no u-boot patches so ignoring them in the<br>
&gt;&gt; u-boot-tools recipe, would be fair (but patching them would be<br>
&gt;&gt; preferable):<br>
&gt;&gt; * [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007<br>
&gt;&gt; * [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008<br>
&gt;&gt; * [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [1] <a href=3D"https://lists.openembedded.org/g/openembedded-c=
ore/message/247868" id=3D"OWAc7eea486-c804-2bc9-6569-2046a99c7adc" class=3D=
"x_OWAAutoLink" data-auth=3D"NotApplicable">
https://lists.openembedded.org/g/openembedded-core/message/247868</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt; Hetvi<br>
&gt;&gt;&gt; ________________________________<br>
&gt;&gt;&gt; From: openembedded-core@lists.openembedded.org &lt;openembedde=
d-core@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.opene=
mbedded.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
&gt;&gt;&gt; Sent: 16 October 2026 03:44<br>
&gt;&gt;&gt; To: peter.marko@siemens.com &lt;peter.marko@siemens.com&gt;; o=
penembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openemb=
edded.org&gt;<br>
&gt;&gt;&gt; Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at =
Cisco) &lt;hthakar@cisco.com&gt;<br>
&gt;&gt;&gt; Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use al=
l patches from u-boot<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.ope=
nembedded.org wrote:<br>
&gt;&gt;&gt;&gt; From: Peter Marko &lt;peter.marko@siemens.com&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; After sharing CVE_PRODUCT between u-boot and u-boot-tools =
CVEs<br>
&gt;&gt;&gt;&gt; patched in u-boot showed-up in CVE reports for u-boot-tool=
s.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It does not make much sense to share git repository but no=
t share all<br>
&gt;&gt;&gt;&gt; patches on top of it, so move adding all patches from u-bo=
ot recipe to a<br>
&gt;&gt;&gt;&gt; common include file where also the git repository is defin=
ed.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Peter Marko &lt;peter.marko@siemens.com&gt;=
<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot-common.inc&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 10 ++++++++++<br>
&gt;&gt;&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |&nb=
sp; 2 --<br>
&gt;&gt;&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot_2024.01.bb&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 12 ------------<br>
&gt;&gt;&gt;&gt;&nbsp; 3 files changed, 10 insertions(+), 14 deletions(-)<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hello Peter, Hetvi,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; There is a bit of back-and-forth around u-boot-common.inc. So =
I thought I<br>
&gt;&gt;&gt; would give my vision and get your thoughts.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Fundamentally, there is confusion about the usage of this .inc=
 file:<br>
&gt;&gt;&gt; * This is the common part of u-boot and u-boot-tools recipes (=
what the<br>
&gt;&gt;&gt;&nbsp;&nbsp; above patch uses)<br>
&gt;&gt;&gt; * But, also, this may be used by downstream layers to reuse u-=
boot<br>
&gt;&gt;&gt;&nbsp;&nbsp; recipe parts. We basically did the revert of Peter=
's patch a few month<br>
&gt;&gt;&gt;&nbsp;&nbsp; ago for this reason[0].<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; With Paul, we would like to have a single set of patches commo=
n for both<br>
&gt;&gt;&gt; u-boot and u-boot-tools, but that can't be in u-boot-common.in=
c as there<br>
&gt;&gt;&gt; is a risk of breaking downstream layers.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Our idea is to create a new inc file &quot;u-boot-common-patch=
es.inc&quot; (I'm<br>
&gt;&gt;&gt; not attached to the name) that contains only SRC_URI +=3D &quo=
t;CVE_*.patch&quot;<br>
&gt;&gt;&gt; and a big warning explaining that is file is only supposed to =
be<br>
&gt;&gt;&gt; included from layer-local recipes (namely u-boot and u-boot-to=
ols).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This whole situation is not ideal but think the above would so=
lve our<br>
&gt;&gt;&gt; issues and still be acceptable under stable policy.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What do you think?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [0]: u-boot: move CVE patches out of the common .inc file - op=
enembedded-core - OpenEmbedded Core layer<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://git.openembed=
ded.org/openembedded-core/commit/?id=3Df4ced8ff03147dd532a88cf3ce08d61fab05=
7522" id=3D"OWAa64408dc-493a-902e-4ad6-e13e50f93edc" class=3D"x_OWAAutoLink=
" data-auth=3D"NotApplicable">
https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8ff03147dd=
532a88cf3ce08d61fab057522</a><br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Yoann Congal<br>
&gt;&gt;&gt; Smile ECS<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Yoann Congal<br>
&gt;&gt; Smile ECS<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH7PR11MB8598F59AC850E4825FC3FF10AD762PH7PR11MB8598namp_--
