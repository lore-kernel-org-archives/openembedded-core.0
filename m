Return-Path: <mkelly@xevo.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0049.outbound.protection.outlook.com [104.47.42.49])
	by mail.openembedded.org (Postfix) with ESMTP id 311C077DE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 17:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=xEmcBWDokmG1ZF4gNFU20Y+z5SDPrPB6zzjWOpnrJ7w=;
	b=c1tVs5CIZKPkbJAkkc+94cr4WPesiniw7oWl4AhU6CwFVnA7pPoNOEJkIz6cD+ZHt/TEA+aPCLcpPTcf7nw18X561POAW+7NaVZW4bJU2kGrgyZoEvVR3BkmzKJN1sbWbpXSpgouMLeLEbOwXlxMhVUBIG+YTJks9WBSkKKe6nA=
Authentication-Results: intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	CY4PR0101MB2934.prod.exchangelabs.com (10.171.223.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Mon, 17 Jul 2017 17:11:05 +0000
To: openembedded-core@lists.openembedded.org
References: <20170710221833.11413-1-mkelly@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <144ced22-b4b7-2923-97d0-b1046e117f3d@xevo.com>
Date: Mon, 17 Jul 2017 10:10:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170710221833.11413-1-mkelly@xevo.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR1601CA0032.namprd16.prod.outlook.com (10.174.111.45)
	To CY4PR0101MB2934.prod.exchangelabs.com (10.171.223.139)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 767f9016-69f7-4988-6b0e-08d4cd36cf3e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR0101MB2934; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	3:ZXo5LLdS+NXCW28hDwxQk4CgCacLLjJtBkJTcXsld7naQQtiI0YAlBn5/2JPQsjANhIn4qZhk3UbqIXjn03AMrcag0MD1CXo/7FVWZhVBuyjlAWgqAsaISJFxJtt+DqFfv7sCB40Iwb67Ro31vqjROtUmfhhpQTqkJQHFz/ePVbuOPSqhTj0jS4e4D3T+yaehp/ZJWdpkI766rzJfesXcaXrCymBPEwIQzBZv3U0HFq2fScSXTIfWAVlFTDN19uRrgq51fcBPI5980a9gmtTcy/THg5/9o0xB06kyBZm78JB85QcMX5ZHNEY2zivKUvuNEkCGYn/EOdq8mVMx2noLA3Uy04R9mnyI35lTaNjxJEqgnlKwlrq7V9B4VjJ7m/5WU98HR9UHwKzeSz7cT49CAlDaE2yiCNXb20+0jQGdxkJamSfXGXopnGuUqZ9YZHgWdzT9lnZ9jWPjvfKwYtu6JSEoe3Jj5Ml1dZ9EZG4dJhxQ7641n0z73NctGngbVhW3iFSC82U28aGWOgHsnUnJ1HeEld+dr4alex+QV39yuLlIEdFAc2pfBKMCaL0BMSAEuz/JrdQNAXZ+5AOccCz6n3BtA3rcHqWfG6cKSRS5NClx0JyF8OYS7A06iRWXpCe4Yb/PhkH/uBQfvjjdEH3uQcmOD/rQg9SgMB/wNB7J8ZLqJ33BSqLPMr/XKv8WuMKRWpSGjFFjB8JiemxBBBG94aKXUvhxt6C5Hx40bu5N40=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2934:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	25:vCnuyPiTRnQmdQm5X7PY8vMNd7lDxShLsTkDmz7hMU+Vmtp+MVX/mc6518yQRCncJfGaTCVTMP3OnuIztu2it4skgfmGEhrgMANqVZZ1eG4uVuEW5Na1FWXG6D7P+aiQHxVHBACUlkL3xF0A36/LX4fC4TFHIH9AKTfAmMsJDcBliC8D57HpgnJKNIGM1Oaq5E5gasC/u3DvyvzEv8FkSrKvKs5tFV98MpK7AYjwhIocDTFDSXumiaTtN4FIylsmkhu5NbzfrqEqCKQ/+Xqt15NExMcokWbvPtzxvVV4UPR6wtXWVMrjv9Ym/55jdBTpyobRXJsTC7mzLrxRf1LZokBxursBSJFISWNTnBgvepW2RHpmtIs049T+vY90pVeM9nrY9vl2nWlj3x3UwQMQDyj94XnoIt7/thgUFASrSNaBqnYmEtOPqsdft5XkL3yZYiM/VpSlVguukhwoHQk+9PQXm4yXKhVrZ4qWt+djskFKJXMaYiHGENziyMHlh9oNqBupeZKqBRcbQqRdRQA/3ad/bnQiu2YF9CF6kar1bwa1+k+cUOieEJLRAwquz/K1G19wMad9zFsTBgMadFyJQ0wTzxzA6ezioSurLMX+xXXHFjFAB0JPsFRg0kCaXDK/DxJUWTi0S9ZqX02+Q7BepzqII5fO0yIJY7POwV8chXl2emLsp53lZKfIkAQ4M4iT0/dwQ6j+UOUz2Mo9OKm//4wREgW2TtuP0q/Wvorfpl+RkJvNl5YbGR1K9Qx7PQY6/1tJ0q4x4sxmCf8K24bt3AQhdZsxcdcbzrSHuFK8uvlYb2FBOnNs5Y88tyRxKCmfwWOegYZ6spbNRsTBRUr+yr1fuP4RS94QobZVNRTUTHq9fQ2OKCCguOCzmC+4DlQUvxt6dLmsfwYs6vUGxlU/BrYJ8yPrkYmsOxXRzTsuqgU=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	31:Z4/h5myjWM40u3QpFM5RpJsm9CcgR3kQPk8fpyKTxRFYTRcZQetG4U9+Yyo7/Kvx4+NPDjP0hyMP8PkWa/tatKtx2Xg98TmISFY2oaER2ak2+1+yfTxNs0+Z8eijdnHflOMsjmR+klTGDPOhoyGL5b4reT2EarHv6H9zN+U746uiryR/C/vY33zVYekMs8DqQRGTOZE/9FllRjD3FhW3jbLwWVmESSyU2WeSpzGCAG/qYMdDr19qc//8G03OhRoHx4mAa2SKV6uBXZ3eam/vy1ixHLa5wnirkLJ151B8pQXhHemNtRPXcVeoTked713Hfryf6l3qflTLUKIkY9w/TvCOVT7nET5rY+fAMK1jHm6r4MleicdqwM1p95146v0nQKx4wk4aaKnn2AZyAbcNfYKvlGWfM5eVvD1cb59hR/Whu18sUuCwqatlqZYmSsu0Gm/JRk0IIsIFRKh4smnGowtmyL+8W468cgKh5ytk1x5wX8DuS3LuMfDkYP0MIm6lN3912UzkPli7Pdla27scC+czf3CDsGH6lvdNdFBNpb8qAGeoFHoH1yrXTwjAjoaxWhs/mhtNj4+Ib03Eokyf5alPF7gRzBZoOE6CNSYYIzmgAQzbOJk4hl3pkYzQrOaLX719VV6I5vi6mEsaBEJPwqRDtWCZujtn+BxvJF5Z7ETeVGgLBdXtRlXmmZJT45RTZRXsw46qwHnTbASPzxIx0A==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	20:xEw3z8mQ2mu1RowcdFaEkcSnV4JDHgtZcTY98VqGrd9ddtdAP+fDmYFIaoaGQ0fkGuRSSNF7Zzj+2Yz/6G6Hf+M9k05J+5WnNWd/0msGohP441uMNcOtbmOuTizRV1kOgavdEUKiV44o+QPjvDxLaWTNgLBv1v/BFbCQA6Dg7fi6KnGXUdzGN9e7lq0I/c6WTsBLech8wErIe0vGyoFpbKrV+VznuffFy1ayICLbgPM4Q6yfjKlUzznIOmccs9B813DfrkrAQ2u57hUzUoK71PM5NfhV6fYdOKqRca0R7Qhf96P6h3wbl9nVFrzNKK012wBfS8+s63aIkaCPRo0FkJG7s9eLOw6H8UBUd4Eqa89rD960mXyz3Pyg0fmfpl/LUlaxdF3/48uIkuQAHUxkn6njH8hYaeheXiVV2bleIBs=
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228);
X-Microsoft-Antispam-PRVS: <CY4PR0101MB293493B00D79F88B6E8E1EAAABA00@CY4PR0101MB2934.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(2017060910075)(8121501046)(5005006)(93006095)(93001095)(3002001)(100000703101)(100105400095)(10201501046)(6041248)(20161123555025)(20161123560025)(20161123564025)(20161123562025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2934; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2934; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; CY4PR0101MB2934;
	4:JFnyWI8wNM/yex8409mw9NcNowasJRAipaLd?=
	=?Windows-1252?Q?m9dqRaAg0rC2T+PBXAVrYNkjsf1PxIZW5OepunKusDEe+RUPOtH5t0av?=
	=?Windows-1252?Q?AGSHaZNS+JWELi0/5fY6ZJm5jXXCW7WKhvWBrgY4gFayqOTMNvBNBoOv?=
	=?Windows-1252?Q?kr2yZWsA5Dyom/ktFiYeJWySeUsQCNwtW+R5aKoNjPtHD5qoq8J/7fjG?=
	=?Windows-1252?Q?yUgAHzbjiojZ6M6fBj7nJ/rMeP00g3TAfhKCv6WCy73R68DmaBWqXKci?=
	=?Windows-1252?Q?23US79gYfE05uao5xvrRqhd2nZY6EVdWo/c0Zy5jch9fKX9Qlx9jRi/9?=
	=?Windows-1252?Q?cKrAdvdxXFWyrjRagTqeReNxTK0Up9iXReHea5+w91kahtwu6Wg45zgW?=
	=?Windows-1252?Q?+whncyoBJdzTF+zDjIyJR7jbUjW290yutru/EoMDToZX/y6JJ+zKYHQb?=
	=?Windows-1252?Q?O+RgfRwzjc1WQKVz7g+NTba/w///m23Ia7+2nF9+FBMdEb7g6vVy4+RH?=
	=?Windows-1252?Q?Ow8vgObnN67ERSbuweIz7O6RX9gRfXSFbzxMy3HOk7+4CgQFcIzM9UZP?=
	=?Windows-1252?Q?UMuCAvlIwWSTEF6kNC8CRyqdgNRTJ6SpTsGIeIaxiG9IvRdr2lh3i3xm?=
	=?Windows-1252?Q?6qgXOpQI8uzsUP+k45i7dN7QMosC68M9KYfoO5obiFlR+5r7d0QtHlTq?=
	=?Windows-1252?Q?+soSOEm8SHQ2vkn4qvphNzlPSFQtIf/zXKfG5x7BB4x7G+Wu4fwfESB7?=
	=?Windows-1252?Q?ebjiqYOsdVmqVArLmulPKuFKsA5aLWIN1Tut3bWC1uI4Z5jNEs8i0utg?=
	=?Windows-1252?Q?AOPox9IN18Q0a9Oy/L35M1q6nc6mqRyMvjVXHtqgKrB9TCYcq0+RUbsx?=
	=?Windows-1252?Q?CIxlt4yNYyaf4iERWHs6HppweRqxZAYfIdXIxt4CG6tW7En3OMFHuzKM?=
	=?Windows-1252?Q?p/IF+GYkZf8dffKVZhHDAsB/wLIzsYePKak6C92l8xgN+iHQfSDuouV9?=
	=?Windows-1252?Q?7z+52z/NRURbRI3Y/wyyUnAHE8a0kIarWUV+vNcnvGNX+HZbjxsA74tH?=
	=?Windows-1252?Q?OrMWT8A96YouRHgCvSGtkPfMFvxnrEKFNya+FAM9Rv/W3+vpIifffbJb?=
	=?Windows-1252?Q?65GvlFcyFC0T2GnuxC+/AOZWGV8NmSLapEv0wyglhgAbFIZQGb82bUuj?=
	=?Windows-1252?Q?fenh58isQElQ6Keo/p7m5XtxnTDSKJAvq5JDaroyp54P6NSyHZyAf2zD?=
	=?Windows-1252?Q?qLMEEkedQU/3WKFexKBFAXxTxn8qNDOpPAaM9Xm8ukrtoUL9nTzPQ4O1?=
	=?Windows-1252?Q?psT8?=
X-Forefront-PRVS: 0371762FE7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(7370300001)(4630300001)(6049001)(6009001)(39400400002)(39410400002)(39450400003)(39830400002)(377454003)(24454002)(7736002)(4001350100001)(230700001)(66066001)(53546010)(2361001)(77096006)(2351001)(54356999)(76176999)(189998001)(53936002)(36756003)(81166006)(8676002)(4326008)(575784001)(50986999)(2906002)(31696002)(90366009)(6486002)(33646002)(65806001)(86362001)(42186005)(65826007)(305945005)(478600001)(64126003)(23746002)(47776003)(3846002)(50466002)(25786009)(6116002)(6246003)(31686004)(110136004)(5660300001)(229853002)(2950100002)(6666003)(6916009)(38730400002)(83506001)(7350300001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2934; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; CY4PR0101MB2934;
	23:Cn9qLG457Ma5Szu0sQYCpbE6sEZeA7EOuEf?=
	=?Windows-1252?Q?1dhKhPWAizYmQEjYeA/wELmXhgX+Klbi5hgfPsPt6K0eZSkmRXxUCPC1?=
	=?Windows-1252?Q?TmZF1d6m45zzJYKd9UJty2HTPykZFjEC97CqmLPrcTkrXnRpLoIdRgii?=
	=?Windows-1252?Q?mydc0BT8E9aGv4cQAJtHTFup7oZtA9/dXoKI7qRoBvr3ccrNXlFQUTb+?=
	=?Windows-1252?Q?ej/5IuSa+uGHvm4ogL0tt80gtoC9EUodz1GtWA1ZqHgAfRGCjSSSTDOG?=
	=?Windows-1252?Q?lfMSn7N8Q9QCPeUNXg63YERMw+nuzkHCM4ya7jE6iUdRgQQP7Y8c8/FB?=
	=?Windows-1252?Q?GboY9SZHOlTVgSxVVv+x9WWNDlRNiJWmkEbIeFwflI6ZrQSob5SWMVMx?=
	=?Windows-1252?Q?HsvrDBGnq7atdMTp5RguZmk1f0AdeEhEHtshWz8tytWW2iSW0zwGNm1s?=
	=?Windows-1252?Q?BrTJcSRiILjRkzaYSVQhk7T2JQPL7iRHKem2aHS+V8ofXRzkbO4Y0W0i?=
	=?Windows-1252?Q?NV+611+Ri2IHn6xy0OTPvXAJX4Cte1YfaRRJlH06z+ynXLY4ON9PWnJm?=
	=?Windows-1252?Q?kLz/UhKqXCP5+2xJGgmC0KDAp5N/ChYU1Ab3ipixu7V9Qg2P1WRdtlGN?=
	=?Windows-1252?Q?JMnZBwQO9BC1UQHDwnJyrNcaod/hknof7sJs0LM3wb72L88U9w6upM33?=
	=?Windows-1252?Q?vGeCwoe7Hu5ZT9/pXKGiD17xTNZJAgcrBkdmn8x4vzx5izwL+GnMkbzW?=
	=?Windows-1252?Q?ueBlnZQTaA3i+Tae8EEsiKgxVRRUK0SqcP+c8Lc8RuEUcGmrrLpTnQXM?=
	=?Windows-1252?Q?xKm2R4SSfsQf6H259wmw9wyPf2otW5UOBexwSWOemcEV0Siq15Fxr4jh?=
	=?Windows-1252?Q?1EL1lsAuR4MqshHUfe+vvGG9uqmqMxv8QhzFwxoH4vbw52bJhC7cto5p?=
	=?Windows-1252?Q?z67TP2cVme5n0V2kZP565DVLtDhoqlRWiTa/2XoheGNr1tXcx/i4uaYt?=
	=?Windows-1252?Q?iHfqEI0ZoSbYf76rke8f/DWECKtbl4x19q3v50z2pVy4Zp9OALqfwq/D?=
	=?Windows-1252?Q?P2J9YL4Hm+TbKuz4JgojWQwcE/MIY/yG4t5BSGuzLNGmoa4r4WIAkyU4?=
	=?Windows-1252?Q?ifwHjL0AVwSgzQiaLALG8tfWvDb9maW5e5U+rjBDK8C2/qpEDLZBJ2El?=
	=?Windows-1252?Q?KsLlQf4g4dbuy/xy8+ndvOjmFdonUvzRiefcdW3eM6pDzP/tt3bKhAOg?=
	=?Windows-1252?Q?IoxP/uI1E0Xscnf7+Tvj6NA/XuFJBj/+xsRxVgSzeAqpKjPKwplVJUUc?=
	=?Windows-1252?Q?dV93c5iMLNtUCBy/QR2e5ejhOjPp2AFFwCv1GSI5Kzliz/fLgOmCsVN/?=
	=?Windows-1252?Q?DR/ai5j2MVH5lXT0TNTA/VzO0Vp5xKHJTGTtESYKsE1FCJvJ7eFeYtm2?=
	=?Windows-1252?Q?8+zBU+P5irGIUiIhC2CYKKVFmky0PlTN2Tk3x6HX90q5bExRUBjkYA8I?=
	=?Windows-1252?Q?ynFfmSbWc3Ful6XyoN2IVFz7GIUvU?=
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; CY4PR0101MB2934;
	6:utn/JpxRli6UlTCNuwKcMrHCNjm2kWI4Umc/?=
	=?Windows-1252?Q?+hhmuYtORNuDJZcXwhbMx8G8dP5gMvL1+/Ylyu3z5/cTCe3buncopg+K?=
	=?Windows-1252?Q?vFBk03vBIOD7a/lKctUY8vfBpozu1wRoijPE0wteD1r13mzJ96qqcL/5?=
	=?Windows-1252?Q?Swah+iIKYwUO9yCEwtW6U0/2nw0kgh6GtxNXMq95hxA8+jYvw/hC11Tf?=
	=?Windows-1252?Q?7y9GQOLYq0X7qdzHe2msJ2sxHlvHz360PPTEiPlJyT4drgixCFdv5Qmr?=
	=?Windows-1252?Q?cfwqR/Y6NPbQeZneVOw7iToTW9VJxZM6/JKMOIQMRz/fhYAaoExyoZBD?=
	=?Windows-1252?Q?eTj4OAExo5Qp8nu8hvdRfnhmG5YPq1dI+DvdrVhz4OxrYNOV3AxfgA8w?=
	=?Windows-1252?Q?DYOJBRH16szVk2p730Q2kTM/Nx03+U0Ng+Fpe8QBNSACor7C43EKyjeo?=
	=?Windows-1252?Q?lyHiC3gOOFoEuay4HzZqx5iT6IGZCCF5WP/2Xnvf38Oyk21U3OIt9vJt?=
	=?Windows-1252?Q?SwzfQZqE3+qQNslUYiz7DywBXZCbqpg45NIBC6csQ+wqeXEc7zRgohGP?=
	=?Windows-1252?Q?Itfb7Au4cqQh98Kt5QtpTT0/pkOqdv9veFYvVEHA05hv4DK2yiJlMuGo?=
	=?Windows-1252?Q?1qmj2n/RFkuXbccLAwFbD/k5PnuQDKRRVm76myAfsHuz51tL0EyxII5w?=
	=?Windows-1252?Q?3/ERqeDd8R4Rh/MsuP3T7MsODG+LU52QXK2v5unKrP3la+NZWm0331Y7?=
	=?Windows-1252?Q?oJzWSl3buswwMzgdLUmWoeXYv1J0UCsmCZ9/K4Blb0qny4FcYN5bs5+2?=
	=?Windows-1252?Q?iBxc8ImVhrq+H+pxWaNtiMGOkaulYU3nZojALJxh+5dSzRvibBg90RiZ?=
	=?Windows-1252?Q?MC5lLpX3kqgQN1gTM+z1JbB8r0ukAxCS6fu4Ni92VZqyJlrAkL3gz3g+?=
	=?Windows-1252?Q?np87lWG+paIgYH6MQAeV4F60p6ZfNPB2r6p6DdGdlGS4ogSuiKwOISAt?=
	=?Windows-1252?Q?q2VuJ3YyhiB1qzYUwzvhnfeAPPx8Xf5dm8XkE7JKuJw7vBttz/qUILoP?=
	=?Windows-1252?Q?PMEO0CwEi9MwGRU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	5:zkq37eqTprfy4dD2TH81Q9cBfc8n5NctmRN6iGirkLAywmSC4RdyZu6RodG5UIWaaEZl0OZkAO8YNsOX/q13jO4bJtd+lSDevun5yKyI0oGbrpJ1nDsjHOwswcSm96f/jvo0q9D+JRZ+pGnvKZEZavAXlS2JOpiHF3u0PHMeA9sZAVqsAyusewtc+iHZ+E4k1tFih/jWG6bjOXOdJ40Xl8PVpEUvZ9CA+fdyHtCmplOPhrljhXeONv7qGusyaY7I3Od98HmXKPpJ8D7uIrcZ0/d5aqurso0f9IqiZItKU+XaZGlXgADx0gSYxnEZ2AigIs62uJEG6AuZhgWS1dzVEaHjsNaerWtKxrz0ABjYs0Jnvp7gk+NYA1Jl4PGyRdEGUwQKkbmsNiO7XVohp38ob4WT8ZPsPUuFJbY5gKnJK0R2dG9Hz+kA0ub+2sWkkfooDN0ORO+h8AoSxtABbi5X8JWUcfzVoGa8Vwam6QuZstvhZTtuv/TZOHJ+zQq7qir9;
	24:j6ldXlLVcUU8Vtx/eC8eIYY2gT4EE4c1DfzPRL2rnEXegEExy7okN53lHLPFMc2PqZjbkrOHR6ihCVgydp1keELuGyDFC9W2SwM2lvijxXY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2934;
	7:NCv9kZRoUD1nmzOz7OqaelJGNzWVsGK9NsqQZ1r/2xSzAomLdX/ftTePdB6nHcWBXI9saadMNKEFYTcmlt7zdj78HwgDNZzvdk5PYIKxSKZPmSF6ufmDuHVWFoZY8OF48IB+UnSlSV0Vd8gooYd9cR8IgS9bAMhlqLZ7Nubq47/bA81HQngG6yaiTAzus+iCfsW+thHvPD+VbC5DS8tDAHqp0e80DDhw+Ll9wexSM1GFMqc32DQ7IAMU00ldSn8Zir4zQ3gAFd1GhIOLKzT36a0oDAIUQELBUZyFekBS5zs4HgkRPNB6xiqW+73AflRVybIUmRy3uX/ZYBmPckSk8ZXrmUjeC78+RIO7Ude07sr09hgXt5BV5rNVj8uAhuAll+n/Vf6qjmxXwCnskH7f6D/Zk2utp2ecf3ovg23Y2N+nyyNadMZPo4yBgOTqVs1k16k7BqPdAm9meDogEsUfLh9z1Dw+R5zHFk7SdhWqCcky2gpyIksJirggcAzMAisYVK6OF44yZjgj4FLV3cMpB7WmUeEtLApj92YLT+VrY2AbLqvOv8TZDbvYL5PnCJLaUJqtwq5JW4Bg5BQr17/XT8KhRt9AT2mPxNfFbBlarqqY6v1QmVz/gJhhAKkFPmoCd4ohBwl9bIeSCCVrbl5ioQ8f3Bn1c2CwDXIlCh8RkB+RlQnuBhg3cAjH6kzgjdN8ZMTJZt8jH/mGDE1d3/M0l7jtavkGj1rZ5m75bto1B4cX6YgpMYmTNKQGe7dP0pY8/zlKirXEIUvurKT6gHtsVn1J37S21EjQwmrebk9nSEg=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2017 17:11:05.1992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2934
Subject: Re: [PATCH] licenses.conf: enable CDDLv1 license
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
X-List-Received-Date: Mon, 17 Jul 2017 17:11:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

(ping)

On 07/10/2017 03:18 PM, Martin Kelly wrote:
> The CDDL license is now used by open-vm-tools in meta-openembedded, so
> we need to add it in order to prevent warnings.
>
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  meta/conf/licenses.conf | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> index d210a0e940..3e2d2589ab 100644
> --- a/meta/conf/licenses.conf
> +++ b/meta/conf/licenses.conf
> @@ -105,6 +105,10 @@ SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
>  SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
>  SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
>
> +#CDDL variations
> +SPDXLICENSEMAP[CDDLv1] = "CDDL-1.0"
> +SPDXLICENSEMAP[CDDL-1] = "CDDL-1.0"
> +
>  #Other variations
>  SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
>
>

