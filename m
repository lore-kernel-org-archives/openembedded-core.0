Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8393.1793269090254361299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 03:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eMvhnZJh;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12984; q=dns/txt;
  s=iport01; t=1793269090; x=1794478690;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=Z94hMwrtISc50ftd9D80FuEgaKdGnbNGm16GRzSqBEQ=;
  b=eMvhnZJhpbxeKgNVg0qArSMBqamuqMdoAMobT+9p8cGG4Drrwnu5rw70
   8e3QrdIaCC5fCXxjJjh2QkAQMs2k6qWSD28YBG+HEGrVsA707Ks8C521F
   6BmCjez33pGU13HKNEKkS8b3+5fXqNKLICjzXajswgnTbNkBd9zeKUf8t
   hu63zjxcrhRuw+jJeZAJc9YW+X4++9ajr4lmB5Iyi1bOvf/OLOaoaz4IF
   yJXtzhEhYRUOaVmHml2HNJTyRlonL+LQHexzQ0ZN+semSzbYGofB/MmNZ
   nWGjflSJtptMcZ8T+U0Ee2nqfwUkpzexCqy5bje1UDE147QaE6um4pZu1
   A==;
X-CSE-ConnectionGUID: fiGPZGrkRv+7GLD8G/spqw==
X-CSE-MsgGUID: lC/o1TPxRBa7s6XB0AMqyA==
X-IPAS-Result: =?us-ascii?q?A0BxAwCEHONq/5QQJK1agS6BK4E9MVOBCQKBI0mIIwOFK?=
 =?us-ascii?q?4h6A54cgX4PAQEBDQIuARUNBAEBhQUCjhwCJjQJDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAQEBAwFKAS0QAgEIEQMBAQEBLicKH?=
 =?us-ascii?q?QgCBAENBQiCe4IdFkEDAQIOqjgCih14gTSBAYMpAT8CQ9wPFAGBOIVAgx4BA?=
 =?us-ascii?q?SuBNYJdgSMYAYNegR8nGxuBcoFXgmk+gQWBXAEBA4E0Kx4eg1eCMASCInoSG?=
 =?us-ascii?q?3JNHmUJjCIBAYdTUnIiAyYzLAFVExcLBwWBJRAzAyovLSNLBS0dcAwnEg8dF?=
 =?us-ascii?q?xEeWBsGBRIgKkFDW4EZgQddgSspYAECH0YtFYF2AoJRgSNdAgFJQQ4HRVMJJ?=
 =?us-ascii?q?T4FEkckIggSCQETGi4LgRo1PAkmQRUMZAsaBRpICAILAgx2KBEQEx4gJjIEA?=
 =?us-ascii?q?x1tPTcGDxkDBIE1BZBxB1uDDgGBDQEHJCAvgTUPASmifYF8oXsKKIN2jCKNP?=
 =?us-ascii?q?ogyF4QEgVeLPQOZVAuYfSONZ5sOAgQCBAUCEAEBBoFoPIEoHwsHcBVIAYJZC?=
 =?us-ascii?q?UoZD5IkgX+DFMkmeQIBCDIBAQcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:JWvWcxR9iZxJabHAFzMt4EYxHdpso47LVj580XJvo7tKdqLm+IztI
 wmCo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:STGYj67rN1/qKhQIdwzX+gxRtGHGchMFZxGqfqrLsTDasY5as4F+v
 mAYC23UPPeCZDb2L9xyPIu18hlQu5LSzNBiSFRuqSFkZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpOuvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eM4w3wtRYG2J06
 79HBxQhPj/EnPqv3+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP00n1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZC9YIWNJoPXH5k9ckCwo
 kmB+D3FOgEgHtXA0mS12CqFo/betHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPAXy4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9dAfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:HBUweaAnI5FfOIvlHeissseALOsnbusQ8zAXPh9KOH9om52j9/
 xGws576fatskduZJhBo7y90KnpewK7yXcH2/hhAV7CZniohILGFvAZ0WKP+UyFJ8S6zJ8j6U
 4CSdkxNDSTNykGsS+S2mDReLhQoqjjzEnrv5aj854Hd3ASV0gU1XYDNu/tKDwPeOApP+tfKL
 OsouB8i36Lf3MRYs6nBn8DcdTiirTw/q7OUFotPTJizBOBow+JxdfBfiSw71MzQjlPybAt/S
 z/lRDl5qKsive/yhXN/W7e5ZZblbLau5p+7cq35fQ9G3HJsEKFdY5hU7qNsHQeu+e08msnl9
 HKvlMJI9lzw2m5RBD3nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxri7VY6tt0U6t
 MI44vZjesTMfrzplW72zH6bWAtqqNymwt6rQcntQ0abWLZUs4IkWVQxjIPLH5KJlOL1GluKp
 gcMCib3ocXTXqqK1bEo2Jo3NugGl43HhuAXww+n/b96UkNoJi8pHFomPD2WRw7hc8Ao5Uo3Z
 W3Do140L5JVcMYdqR7GaMIRta2EHXERVbWPHuVOkmPLtBMB5vhke++3FwO3pDgRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo8ERgMyxeJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR/vuN3HnF4pF1xD3H5NSNX4dWssIvctTYSPCnuvbbonx8uDLevfaI7TgVT4iR2PkG3
 MGGCP+Ic1Rh3rbE0MQQCKhLU8FVnaPiq6YSpKqitT74LJ9QrFxjg==
X-Talos-CUID: 9a23:39q1227vuIoyN+g/aNss+k87IvIKaH7n0jSPDGuUWUkuU6WMVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A4m5QyQzHAXaSJi0cKLkxYRbqZ5maqKCFT0dUra0?=
 =?us-ascii?q?WgeONajcuCx3FpRGuU6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Oct 2026 10:18:09 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 27D60180001F6
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:18:09 +0000 (GMT)
X-CSE-ConnectionGUID: npsAtmJhRV6gLBy2ldB5/g==
X-CSE-MsgGUID: hSsHTKr/RQW75fGK/WK32w==
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208,217";a="70251730"
Received: from mail-westus3azon11012017.outbound.protection.outlook.com (HELO PH8PR06CU001.outbound.protection.outlook.com) ([40.107.209.17])
  by alln-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Oct 2026 10:18:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Od/ALTa9TqFORiRE9dvGpKvW0Nc4hRE8NSUAqQfbIqTtORKthylyF3jIonYN3GjeREtVpx7bHJq5CfLGGGL+aqmx7M+pXx2uuMde73nCE3s82TMVy2bXy8+7oMKgLNSyLxizPzaUSV56yYITg3xbOvTVE+RNUnnul/Vd2GelDamxhRfaxigsTaj8dNsr41jZdC+ukx/WiLWqRoBbu0j96iDxhHV91Z73+Neb1JWxqs4TwlEwx48w3og15GrcJ4+e++zoiOA9pXhQpvLy0vDHVBF/D37NpnbKy2U9mDFCyMDQ9alWze/IDnMd/0KwOqE+gz7odhTOPg0cjmoh5wpVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z94hMwrtISc50ftd9D80FuEgaKdGnbNGm16GRzSqBEQ=;
 b=XaOH61sxEODjyjFTx/Op72nQeGvPsHLgHYg8sw9e+R7XwbZc2N+HJfRTEr62rjE2MVTl2ZP5SLuEefdPgwQyf+gLKb5fxGDgzUJ4w9+ewopUpjCYpFIZMuyw82Z2MZx+KRIBgra5fPDDuPMwSxnisYvXTkJ72g/+jzuSBwhs6lFbz6xAvpdSh9v/fsnslN8E8/nB/cSRw2S/0CU9BBwEIADk/f4BCH1KuSY4gpbb9aZsLeB8L280UpFFrr+eM3OYv94JzPoalLXW4/I5mdbroRliBuZxUJGpcsQiyn1BXqaiprh1f+WFMm+McAPLs4sgruqz9flBRgHtEYxGTVM19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by IA4PR11MB205273.namprd11.prod.outlook.com (2603:10b6:207:144::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 10:17:34 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 10:17:34 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH v3 1/5] apr-util: Fix CVE-2025-49506
Thread-Topic: [OE-core][scarthgap][PATCH v3 1/5] apr-util: Fix CVE-2025-49506
Thread-Index: AQHdXKCPusQWX3U3EUiKzJuQeqtzhrcTAFUAgAFid7M=
Date: Thu, 29 Oct 2026 10:17:34 +0000
Message-ID: <PH7PR11MB85980B9096E15493C5C85B8AAD6E2@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20261015122721.2278428-1-hthakar@cisco.com>
 <DMGHQLTOWJ0S.784QETD8PGOO@smile.fr>
In-Reply-To: <DMGHQLTOWJ0S.784QETD8PGOO@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|IA4PR11MB205273:EE_
x-ms-office365-filtering-correlation-id: a233cd1d-1ed4-4952-52b7-08df35a5d9a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|8096899003|13003099007|56012099006|4143699003|11063799006|261028144727099003|10067099003|261022113327099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261026121527099003|261026140227099003|38070700021|260925022911599003|260925021311599003|260925021911599003;
x-microsoft-antispam-message-info: yY/omY0+iz9mIe+gT0x/GlS8kjkUpCPE59hLmYo2vM+81OG9vmqEzClIpNpmyJwWk9pbx4/T8H591EzUI8r1Hr55EpO0GhLsNOAdcMh2IsuPy9p+NnFam2OwibuDttXVnic4Hdsf6UYTOaAikHUstkS9Uho55Xd3/jIp48loqxz8Vi/suyAQyTzWDPkTKzSn2ch85A3fmKaoZbn6CjytUfqZafNTyvhPusaRqnT/WJabgF8uyQMoYAG76tliItA97eJ0uFP+gVa9FZlCLUhU31pzxbEYNWFI4KxAw/lFFzQUDiuQDoIskS2MTqkLYgIGYiZdntPl32GhkRjHlw43Opm6KtyuMRZ7/lcnay3/Y0Nl2IQ32bGodrIM9SbnbosSAictF2l+cj4TsOe88ZX8h2wXP9rvEDZyytkMoKyIVAiQHfafVJTzMvageXgoGU+eVEDuws/QXOEdMNgVJqGR9l2H79ANuBFKzu+Ib9iDC2W73DqjcUXfNYeXF6Y9VmsNx50qhqgn0xovj1XwKZyDxbIJoSF+kyNExZV5mB10tDk186FJsNQ5B9XCrotfyUe+5D28kC1m3aFQ5LapWYydHMLBb5lgpNDtpqSW2i/6xiorkLmtW2xFx7+zcPevytMMTI4Ugn3hFLjnODGITtOwBoG1tm+dEMQJwzAGWg+edKIV5gKMyi9ouM7D4m1uwsTm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(8096899003)(13003099007)(56012099006)(4143699003)(11063799006)(261028144727099003)(10067099003)(261022113327099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261026121527099003)(261026140227099003)(38070700021)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CfoZY3hq2KM7k68H8Ka2m5OcKp3HxpIL31j/7nao8eU3vsi+JAMYl4V/vE?=
 =?iso-8859-1?Q?DcnvZniHtextNqo2grxuzny090NQztN2LPlqQRTCQE8q0nGnrhC2TwVkHV?=
 =?iso-8859-1?Q?WdbRNvu6a55fj6MloDOaCNeUFc/1QPKu3e3h41yxjLE/gATd6YZrMZgaHt?=
 =?iso-8859-1?Q?bWysQdQMiZmp3y26F9cXgxq/ptEK82tgeNbXeOmQ4sUX1feNF9UZe6y3eQ?=
 =?iso-8859-1?Q?VyUeNPa9qrICVTs/FDgB6Ogdq4DvkGTLWenN5kJ8heX0tX34OzHwZ2BhXs?=
 =?iso-8859-1?Q?p5wHjSTVxTV/70WlUDEZmVAD9F9dWbYEocs+3SXv5ovcDAGHs8GH7cO1bM?=
 =?iso-8859-1?Q?uw8WIgzbdJwmahAnnxjuzorqqmuSwJP5ltqAXF4V61TFT155dbCbdDq5Di?=
 =?iso-8859-1?Q?iRmNnNBEND+C42FI+gzfA1Xix+jbD/tCYharhPWgtPgLK/5QNRzmw82q5+?=
 =?iso-8859-1?Q?Y3BuweruL7igCSmxt0LJ163UX0FYSZOAcmD3K3EMTWbNqAzYqEe5GhktQx?=
 =?iso-8859-1?Q?w/18fF+IZPvwK3cjlOasxj/aVLoSpM1LXDyd7vp6Y+Arg7agdyAjNd+VRH?=
 =?iso-8859-1?Q?Wd/oKtoAN2JY7TpbRQ8HQZtx9kGgmSC2FhHKCLk8UwbnIne6jy59CZpIQA?=
 =?iso-8859-1?Q?mQBUC5mt3e1Xo9KAu4trklylejx1kp2VldjxjG06jqaBAxZWoayrNDjVoV?=
 =?iso-8859-1?Q?3XNUmF8q55buEaBAdwMR8dJJLMKBFWXjaavbUBSG5FXiZOiQUp9pN5a3SF?=
 =?iso-8859-1?Q?cpdWgZrdutXWeBuJDBMg4B7tJjksu891hhIPJo2s9VM2ym2aV9DQxwxamo?=
 =?iso-8859-1?Q?V3IRvYj4WEo0ShT2XaeoNvGLWYfDRPCcZNmjo9dsJahhBcrHz6bsJIXlpZ?=
 =?iso-8859-1?Q?FHUxG45aeZBbw7MSFoRBNY4WxiacbLnfU+Z+CnT82huk8wHaNGO3pbu9XY?=
 =?iso-8859-1?Q?Gthxeb0hIskbh/rY1zrI2hR/03uV/ksBMoMd0XXJxov5gCVf5YdpPICv44?=
 =?iso-8859-1?Q?WdclbsdW1RmWckMgDIGt64NWl4Vbyd4vVJnN3q3KQWkzsu0B7uneD4Ukam?=
 =?iso-8859-1?Q?DzR0nl5Qi0bnO3N1cvS3WCQ/d+WSZ/yiwB3oXeVboeWt+ECG+YYOqilzYl?=
 =?iso-8859-1?Q?XbK0xOutIdYFnSfUhoapixAHttIB6edMLaqA3CZMSKeiHQPnG2FSiQSWtw?=
 =?iso-8859-1?Q?ix+PCtmsiGuNEYhXiV64OGlJlctwL6VgBJVLpLpPfgRA829S4v6r+JCYFw?=
 =?iso-8859-1?Q?J2coL7vd7h5u/3oEFQni2mQBha60j4ANzV+wI0FQE4gezBysP0AqPk2uL6?=
 =?iso-8859-1?Q?KGb/Sl1yKPw/829lnJl/PXdCVVzwyy9aJ0V89MdewSq8Czv5qpEGMdpjH1?=
 =?iso-8859-1?Q?hmka0E/Y3bKl0UzjDsmzJmTES7iPrcWprQi07uiB0BGR5KyV5+o/67Bml3?=
 =?iso-8859-1?Q?9g2rztnEyJWtkQGqa2BmvUfuuoM8IHdBtugDjGvo/wP8SZXbSEzUMnLo44?=
 =?iso-8859-1?Q?kcuMk6bJYFClmjQBGz1nfLP3YryU0ajs4DA0WI62f8f39BPM69nVr4K3Ee?=
 =?iso-8859-1?Q?yOEMXjVyTaCJockGuNPsvkSupCu7JkOjDS26gAaWrE8xfYNELVXHHRF8vT?=
 =?iso-8859-1?Q?lNY56zLlyQmf55iJWb/AsAlRa1qTForOiyvJAiOkKo6RpHKOHo9PCZrSaf?=
 =?iso-8859-1?Q?qOwIT7bg581cYn64hCZ8CjRgnHQXHeHPJvsE3fYGI3RBbS1F9VO6PcooYk?=
 =?iso-8859-1?Q?a2omdyrA6KAdUZQMCo/bGaB3oecgwBdP9MEW73M6vulli0?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB85980B9096E15493C5C85B8AAD6E2PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fXvoqDDIPQ3NM4kkO+BRyeRlp+cNA5/HB02J+l3q9/UtWxbYNZ++QFTfmhg5KyK7VX3s6jktFleHUTA9R3Q33j+3tOp/VyJySxWZYjo/dROcs4+GTD8fOLwX/OpTVNoRrHzghDjwopt0bnS1fqbjd5u76Tng5tY8UUrMhUKg0iY8xUFBxSns65jfIslHZCAz4szEKG8oTzSpuW4WVTnsaAA/PPLcISRZVPmlBgT4nfSnO5MDfI1SX4UyYT08Cz/iomLfVujeTB8O7mTZW3mvFDI6WPr9aOJR97YXJUK/5z6mCZ6NZaU7tWoy1TXiE6Y4Tum/F4XNf5L2dxrFvo61rg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a233cd1d-1ed4-4952-52b7-08df35a5d9a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 10:17:34.6452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ht4K1b5+4fOBvUdnCMBUOq5t6FT2jkTo55M0dsHYkpqVsFv6FO7AtK/CIOwxt+d8mDzOHSryOkfWuwrR9eUw6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB205273
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-5.cisco.com [173.37.147.253];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248927

--_000_PH7PR11MB85980B9096E15493C5C85B8AAD6E2PH7PR11MB8598namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
Apologies for the mistake, and thanks for pointing it out.
I have addressed the review comments and submitted the updated patch series=
.
Could you please take another look when you have a chance?
Regards,
Hetvi
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, October 28, 2026 18:33
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@=
lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH v3 1/5] apr-util: Fix CVE-2025-4950=
6

On Thu Oct 15, 2026 at 2:27 PM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> Backport the upstream timing-safe comparison fix [1].
> APR-util 1.6.4 identifies this issue as fixed [2].
>
> [1] https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5ea=
fc534ae24b19e
>
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-49506
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
> Changes in v3:
> - Drop the XLC-specific compatibility follow-up patch,
>   as it is not required by OE-Core's GCC/Clang toolchains.
> ---
>  .../apr/apr-util/CVE-2025-49506.patch         | 310 ++++++++++++++++++
>  meta/recipes-support/apr/apr-util_1.6.3.bb    |   6 +
>  2 files changed, 316 insertions(+)
>  create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49506.patc=
h
>
> diff --git a/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch b/met=
a/recipes-support/apr/apr-util/CVE-2025-49506.patch
> new file mode 100644
> index 0000000000..0ab5cf0648
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch
> @@ -0,0 +1,310 @@
> +From f77a20761cb15686f8d4de5b5eafc534ae24b19e Mon Sep 17 00:00:00 2001
> +From: Eric Covener <covener@apache.org>
> +Date: Mon, 3 Aug 2026 12:10:13 +0000
> +Subject: [PATCH] Merge r1936804 from aprutil 1.7.x:
> +
> +use timing safe comparison
> +
> +Submitted By: ylavic
> +Reviewed By: ylavic, rpluem, covener
> +
> +
> +
> +
> +git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x=
@1936805 13f79535-47bb-0310-9956-ffa450edef68
> +
> +CVE: CVE-2025-49506
> +Upstream-Status: Backport [https://github.com/apache/apr-util/commit/f77=
a20761cb15686f8d4de5b5eafc534ae24b19e]
> +
> +(cherry picked from commit f77a20761cb15686f8d4de5b5eafc534ae24b19e)
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> +---
> + crypto/apr_crypto.c |  60 +++++++++++++++++---
> + crypto/apr_passwd.c | 135 ++++++++++++++++++++++++++++++++++++++++----
> + 2 files changed, 176 insertions(+), 19 deletions(-)
> +
> [...]
> diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-su=
pport/apr/apr-util_1.6.3.bb
> index 3a5f52d250..19f8e59ca5 100644
> --- a/meta/recipes-support/apr/apr-util_1.6.3.bb
> +++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
> @@ -13,6 +13,12 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz =
\
>             file://configfix.patch \
>             file://configure_fixes.patch \
>           file://0001-test_transformation-Check-if-transform-is-supported=
-.patch \
> +           file://CVE-2025-49506.patch \
> +           file://CVE-2026-32327-dependent.patch \
> +           file://CVE-2026-32327.patch \
> +           file://CVE-2026-34501.patch \
> +           file://CVE-2026-34502_p1.patch \
> +           file://CVE-2026-34502_p2.patch \

This patch adds all the patches files of the series to SRC_URI in 1/5.
Please add each patch to SRC_URI in each commit.

Thanks!
--
Yoann Congal
Smile ECS


--_000_PH7PR11MB85980B9096E15493C5C85B8AAD6E2PH7PR11MB8598namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Apologies for the mistake, and thanks for pointing it out.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I have addressed the review comments and submitted the updated patch series=
.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Could you please take another look when you have a chance?</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Hetvi<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, October 28, 2026 18:33<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH v3 1/5] apr-util: Fix CVE-20=
25-49506
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Thu Oct 15, 2026 at 2:27 PM CEST, Hetvi =
Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openem=
bedded.org wrote:<br>
&gt; From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt;<br>
&gt; Backport the upstream timing-safe comparison fix [1].<br>
&gt; APR-util 1.6.4 identifies this issue as fixed [2].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/apache/apr-util/commit/f77a20761cb15=
686f8d4de5b5eafc534ae24b19e" id=3D"OWAa6504ebc-be88-ded0-04d7-7b851559d677"=
 class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5eafc534a=
e24b19e</a><br>
&gt;<br>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2025-49506" id=3D"=
OWA0ccd446d-5eb5-8605-95d1-8f148581bd07" class=3D"OWAAutoLink" data-auth=3D=
"NotApplicable">
https://nvd.nist.gov/vuln/detail/CVE-2025-49506</a><br>
&gt;<br>
&gt; Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt; ---<br>
&gt; Changes in v3:<br>
&gt; - Drop the XLC-specific compatibility follow-up patch,<br>
&gt;&nbsp;&nbsp; as it is not required by OE-Core's GCC/Clang toolchains.<b=
r>
&gt; ---<br>
&gt;&nbsp; .../apr/apr-util/CVE-2025-49506.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 310 ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/apr/apr-util_1.6.3.bb&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 6 +<br>
&gt;&nbsp; 2 files changed, 316 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49=
506.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch b/=
meta/recipes-support/apr/apr-util/CVE-2025-49506.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0ab5cf0648<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch<br>
&gt; @@ -0,0 +1,310 @@<br>
&gt; +From f77a20761cb15686f8d4de5b5eafc534ae24b19e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Eric Covener &lt;covener@apache.org&gt;<br>
&gt; +Date: Mon, 3 Aug 2026 12:10:13 +0000<br>
&gt; +Subject: [PATCH] Merge r1936804 from aprutil 1.7.x:<br>
&gt; +<br>
&gt; +use timing safe comparison<br>
&gt; +<br>
&gt; +Submitted By: ylavic<br>
&gt; +Reviewed By: ylavic, rpluem, covener<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; +git-svn-id: <a href=3D"https://svn.apache.org/repos/asf/apr/apr-util/=
branches/1.6.x@1936805" id=3D"OWA47d0864f-c54d-e550-0609-dfffef71f883" clas=
s=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936805</a> 13=
f79535-47bb-0310-9956-ffa450edef68<br>
&gt; +<br>
&gt; +CVE: CVE-2025-49506<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/apache/apr-u=
til/commit/f77a20761cb15686f8d4de5b5eafc534ae24b19e" id=3D"OWA407740ed-cbf2=
-ce7e-0a2b-7bdb4a376e90" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">=
https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5eafc534a=
e24b19e</a>]<br>
&gt; +<br>
&gt; +(cherry picked from commit f77a20761cb15686f8d4de5b5eafc534ae24b19e)<=
br>
&gt; +Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt; +---<br>
&gt; + crypto/apr_crypto.c |&nbsp; 60 +++++++++++++++++---<br>
&gt; + crypto/apr_passwd.c | 135 ++++++++++++++++++++++++++++++++++++++++--=
--<br>
&gt; + 2 files changed, 176 insertions(+), 19 deletions(-)<br>
&gt; +<br>
&gt; [...]<br>
&gt; diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes=
-support/apr/apr-util_1.6.3.bb<br>
&gt; index 3a5f52d250..19f8e59ca5 100644<br>
&gt; --- a/meta/recipes-support/apr/apr-util_1.6.3.bb<br>
&gt; +++ b/meta/recipes-support/apr/apr-util_1.6.3.bb<br>
&gt; @@ -13,6 +13,12 @@ SRC_URI =3D &quot;${APACHE_MIRROR}/apr/${BPN}-${PV}=
.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://configfix.patch" id=3D"OWA0d50c9aa-d97a-df7c-c4a9-4d7fc=
2ee47c7" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://configfix.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://configure_fixes.patch" id=3D"OWAb0bc12ce-ec0f-eb5d-8aee=
-80d740098c02" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://configure_fixes.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D=
"file://0001-test_transformation-Check-if-transform-is-supported-.patch" id=
=3D"OWAbd5aa247-cc0a-170c-5e7d-9043be04500d" class=3D"OWAAutoLink" data-aut=
h=3D"NotApplicable">
file://0001-test_transformation-Check-if-transform-is-supported-.patch</a> =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-49506.patch" id=3D"OWA5d1125da-a67f-78d3-2514-a43b7c793=
be4" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-49506.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-32327-dependent.patch" id=3D"OWA4d8205b7-a07a-c790-54ab=
-e36a4dddc5a4" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-32327-dependent.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-32327.patch" id=3D"OWA7805c9d8-a91c-72f2-7935-b7e215d62=
6d8" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-32327.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-34501.patch" id=3D"OWA42369f2b-818d-8b8a-8c19-8fa7a7be8=
ee5" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-34501.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-34502_p1.patch" id=3D"OWAc13898ef-2ace-8293-8040-db7452=
f99bbd" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-34502_p1.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-34502_p2.patch" id=3D"OWAdb03a9a4-a5f3-5b0d-0926-48c224=
0abbbe" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-34502_p2.patch</a> \<br>
<br>
This patch adds all the patches files of the series to SRC_URI in 1/5.<br>
Please add each patch to SRC_URI in each commit.<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH7PR11MB85980B9096E15493C5C85B8AAD6E2PH7PR11MB8598namp_--
