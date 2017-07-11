Return-Path: <mkelly@xevo.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0084.outbound.protection.outlook.com [104.47.36.84])
	by mail.openembedded.org (Postfix) with ESMTP id 16D5D77E9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 19:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OiCVvGXOCFZa3DaMCd3UJzATuUc8IKi84rnZBL6VWFo=;
	b=hP/X2J7sJPufDQUZMF11DzaTT45mSdUBpv/JJ8jK24Z7qFTD1CEGMFmdi3mxbHtBGuMWIMN8A8TxQTzTpoLAZamAQv0WM598VC5ylWHo22bP3hJEhYthe/uWkvEkB3YPvTR3ydq/MNVlFLd/6btaQUk5ltY2v0DkhLTMK9TPI38=
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Tue, 11 Jul 2017 19:07:09 +0000
To: Mirza Krak <mirza.krak@endian.se>, openembedded-core@lists.openembedded.org
References: <20170526070344.6053-1-mirza.krak@endian.se>
	<cda9bddb-3f96-4c9b-1c9e-25dbd5afd7a3@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <f0a5eec9-abde-b2c2-cc54-e1ec930374cb@xevo.com>
Date: Tue, 11 Jul 2017 12:07:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <cda9bddb-3f96-4c9b-1c9e-25dbd5afd7a3@xevo.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: BN6PR13CA0023.namprd13.prod.outlook.com (10.175.123.33) To
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a620b6df-3d40-408c-2387-08d4c8900870
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR0101MB2942; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	3:usKRS+VSyE06YOPKPMX4fP8+gXWcwFnKD4APAqmxQpaJ3PIlZHhIsH0knVVo2iri54F3IVmQtcBwkY2iS3mE+m+mN/lPnQkFUoQlBpsPM1sO6wfHw/6F1hxkr7qckRLKJpPdXaNW/tI/to9CQogBjDMXIwl4v2UZGZOAn6TxI/ETrrBvQbL0v4j2TvOaC6QrKMrQtPp43JX3GTmLmPQq6STpKDntTXc5O1ZgijrLUQXdYptOAeWoSGDj6lWH+GAyys6/I4QniduYSn/S+hh3niRYlvCZP18ucIFIr4hKAvxtV9C8wFKy8aHp7qNIqgv01aKOs1AUYmwlGb1FU1rHWhHWx4AqbZnCLjrTaJ1ivmnRTO+0qXU5UbV39qG9PH0wI7a+EZIkK8vLK4cy0L/heQ9wWjXB4+9wl52JRCAki8xwiWqu7Uzbfu5oOfCQYhEBkx/fTU9gEoEWPt6ZAIwF5PiIfK4M9u4br6aDAZ/zUIs4H5lDIj3164p5soe4OLy7TFLxu4wxkf+BYYkE5QovjCULEFPX7tyYEtZSeA32WfzBcPfkKPqb7b0bHtVPn1/O2mjdR8TbStP21F97jxm7xhCdeaqqKXCjlNjLrXIH0/Igf4zg+rDlDBoxasldNNaXlgUxTbtFPgSQOm5rsPD5CBbzyaIXT1WdBQF3UgA4UuEPjhIqo2+gsAvQ0XflHBX9L3LT79Ss3ke3W9xTQh7SXJiOFOwL1K5yAKKWf9eS+5E=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2942:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	25:aZp6Z+ld8vOdqG5iKN83pC9v/9bQM1JfwcIM1CguVy77aLifnVgccutFmG78IE9nG4VjXWOQbbXUjdYKaIDvvavt35UY2EK1RO4VmT3sEqz9Lqq6oWriBSG7WAM9jc5d+/+b9ofpOrmjJXgaOffKF06hl4tsgzIEZwcttg7eHoDJsYgOMufPCzej5HrmLVsl73fp0rNZneUqjeHJoOhzeNOJpih5e+o9gJJv+N2TuDOfb2v7qFeudwgDx5gaqN7haZYIbdxrXnZnDUHW2sVyEzhsYFOH9a32IBWgJ/Acy/nywuHAZjtNjba/6sxkR39dQOPqZ/qLrOoBCxxPc33gFfA4IZpht+MjXGvxl8zprl/olMR2ttRJtzYYX4KOXYWaE60FFhhCO9J+8+J9laFKbpNG00m3SeNmGqs2Lu96wswUNYwvUdJzmGwu8JX+u/OvQ7zUKNQYN/PGkSPJQqyqbXMDty70TNRE5P9wS0RyRVLWOPMlcRnXkBvydOj1hosqRcSObiO4v/T++aVo877GvNn0g6ofs3T6T89zlW0ZMqwB79KyOb9Xqnsvu+ozMW98EmlE/R8f0Y+PXcCuT5XiPbwqOktyKW0mnv8fevAwBl21O3KIH5AgyULrGXDP/krub/kANyjNcg4hyp261Q6hBzjVF1fEajHZXjHvf/0X1LmgGIM6pN8OyHPXkNC8AXakaHdF/7j5yel8W055KoCAWIorQmFjkZz9TSeP/WImUPbMmuYTL0WgJg6c9UJHXjThnhbxhkwHKuz8PLJs+I0+iEKyJqUXe7hOLvT4E6j8Kz/ergRay+uN+vzRJEMMD5CWPwknAcDO2WKVUzUI+Q0tUXGCKSCw2xWFhd4aHBXMKHGK2/Jg1Wl+PLgRMQo7nY7b8ead2xVvItu78c6mXQQyy5EI05tRXlp/GbKQPLE2Bm8=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	31:tPprEffNeX5oNfx73WFG18PFMxGeJktvarTonljC/B2R8YIjlM8HoRacY0/NFjbe2xIHPBDtM6VeGpaGHEhfDTCTQ+sPGGADYOwmisf6CTx+WyQTId4buyTnNc1XJCBQLjC0tivrqcm7kn6C7OKQPwEfywJRg2m21RQ6gTiJbCSUcWgQKa+qRdP9wppYSbz3SnfUnV8OXDMg+u7h1/Vlt1oxxZHqajk9a/16yUb3yGBc4GAhr+mzYbIo3N76UigGH864b4RnuNg5+NPqCELNd2GmFfzYPg6axiinPeI2ZRPROZQf6t3gr/nlaCo3p8Ilyz8I8AhCHZacD5IFTQQjXltWvQ/XmXhNQJxgrqxJTQgOY6utvGnfs5R8YY/YW81sc2cEuYLzssWU5HDqLJvcfbbCvq6SgXC1feV8+oIZLI/Sy9jXGsZIsE1ZbIQGFHpK/TruJufYzmzx2RlWMs6Bo1psuPjh54uszjJtr4c/IHEFJLqABTqYO8hlVY0AvoEN0l+1edk2vXbMCwgVNG0835ekadBw9LuLvBnNbsD2jtXhPyOFFPxQ/mO16SCQbpVYeweQXh5WtEGrVAu1yCkAIJwQ8oOzL/E2/PR1Pb3wjpUuETvFqzK1sSQCq8DRhtuiUAT5H+Z9Qfenfl5K0RpoAVAep7RfUAVVJJlhPS0RLlHtWzBl3CVr6F+GilW/7lkNBpnImbraRsBngnYuIL83/w==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	20:nIk/lNxl1sy4/C8Oo6CRVdmKivieGmMecF5TkPxzdVo2USeS3drYddxRU1B3nkkID0TDks8I1GXERnizbbdnZF81d586/h8sJ+9O5Um/C1HJEcffvY5C/DI3i/Bpd/jo9vOq2n+gA3j8OhsO1OiFsH+dqNwZoTNoNb2awopfugamff0KhMxx7MnG9jTrCd9OJTeVtIi34sKIHABnZe2ePyhq4YWel6aflwXJjgZ06cDYp7zEurnQsNn7rKZSPf9nllnUYytUVEBn1zPuQwH6Hc0+e6ShMepTkLFEBi3D7GmQxOeyblGm37AOQ0xRFXePj7WVvho+K9m+trc+Q3SMDuXMxgWTRRnYnoOGH/CkjgeTpPanVHxeeuEkZ5VQs1b9zsu+Cl7QM4cA4QWZZr4YgMf9m7Rg4lEMTmcJWuK+1RY=
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2942EA264E0DFF8C06DE0901ABAE0@MWHPR0101MB2942.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(2017060910075)(5005006)(8121501046)(100000703101)(100105400095)(3002001)(10201501046)(93006095)(93001095)(6041248)(20161123558100)(20161123562025)(20161123560025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2942; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2942; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; MWHPR0101MB2942;
	4:AnQAYGCkhkZ681v9eQ2o8XC//wXgLruV0jra?=
	=?Windows-1252?Q?5EPexrBy8oety9rVW8BtWktdrqCy1ZwoiD/6ZV1XzA3R6uF2/6HFGrL1?=
	=?Windows-1252?Q?Yi5O71KmeSlxW0+khXwCu7HIfPh2E8PHDj0ZgEOHZQwgPC4rquMHIPak?=
	=?Windows-1252?Q?l7fzesd/LvypqGTZzEnFQsPnid0WQXwzzM+yvvrsnDujq1vMTsHSC8ux?=
	=?Windows-1252?Q?r3XS3iDxqctjnt6jcEgV6dPsoGWVtCVXIC3T3P6uTCNJLNXt95bJA2vF?=
	=?Windows-1252?Q?G4ltn+exgGEx7nvwsk/5oKotNSo/Gsz/szNNIZjbo/cjYxb2CVoSBddp?=
	=?Windows-1252?Q?WmkAJoYWRgBtW3YL5Zu1ZJVh7Zb7vzgMpwti5ik77A49ih72eUnOzdci?=
	=?Windows-1252?Q?bKVjFO5nBfO53erDy9sgEOIArsLbvJYG1Uki2pZCZpTr8uRRPIN+6uh9?=
	=?Windows-1252?Q?f0opbkUb4AN7cChxgbR1BwrU5QtWikQfvyaQ95rAmvfPGfe8N05ePIVr?=
	=?Windows-1252?Q?c2n4ubkyVlfdzNSppTcwreiyrYKlb6PB6IuklykhsIctz/W2JC9z0M7F?=
	=?Windows-1252?Q?jmXMiwLlvECPtpiEwO/CzRNoAFpTNqq9JjzKXyNuMz61uqftzq1BXOAf?=
	=?Windows-1252?Q?7f3xvK7b7scireJ57OKAw/v2DjglCwZ0jgS5K7BLOut4Yjix5aUK2oo4?=
	=?Windows-1252?Q?6Y974vfnDWnvX02nzTwb6SSWBL/9MNJmzFN7AtL5gERavWdxkrLWmc5U?=
	=?Windows-1252?Q?XNEt44KxkRBGbXNOw9ha5itr7X/BYSjrgkKP1t3/7fupbSCuEwBsFmy0?=
	=?Windows-1252?Q?ZF8h7y/dXgkxDEHVnQ0x0g91mosMb3RJEi+d7lTFwbT57RqLr9DCHP3e?=
	=?Windows-1252?Q?gqPgYzZKID27GLsVJts2JBPmQf/CWAj+4v5QJpbt1I0Di964Uyh3Fqw3?=
	=?Windows-1252?Q?VZYlUQGQo0RanUAlq6S08qfQ4DIPD2rFF2kdupAZNOZgLO8IbCP4H8zy?=
	=?Windows-1252?Q?ZRwOOBnajxcP4qgmdEcN+w5LciF/iP++dvNWWam4JN7d2a5jU9+cZjUN?=
	=?Windows-1252?Q?G2tdU5J52BjqmSg7WeGZf6gZUZ9fdtRGtBnVuzGJcJhxFc36iCBNMdtr?=
	=?Windows-1252?Q?UBzVsU6euvmo6pNsFfQb3ozjB/UNS7SRKGwtHLulqltmqO6HBetFfETw?=
	=?Windows-1252?Q?m4qPdkfMCknDRR+YJT7l61O7sn0+nQe19dehZpeg60HnqFCIntL80i5P?=
	=?Windows-1252?Q?oHDuZmCHTBhHzRvYBZuOG41ntd7ecY5I/+KbowrR6JZxBeJBmPgXymTQ?=
	=?Windows-1252?Q?SliZ2ho0x8Bx5bYv3aYtePVwbaHiyycExfv3gIwX5eKo2nQ=3D?=
X-Forefront-PRVS: 0365C0E14B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(7370300001)(979002)(6009001)(6049001)(39450400003)(39400400002)(39830400002)(39410400002)(24454002)(377454003)(25786009)(229853002)(189998001)(966005)(2950100002)(4326008)(53546010)(31686004)(42186005)(65806001)(66066001)(33646002)(47776003)(86362001)(478600001)(65956001)(31696002)(77096006)(4001350100001)(64126003)(117156002)(50466002)(2906002)(76176999)(54356999)(81166006)(7736002)(5660300001)(305945005)(3846002)(6666003)(65826007)(36756003)(38730400002)(110136004)(6306002)(6246003)(6486002)(7350300001)(53936002)(50986999)(90366009)(230700001)(83506001)(23746002)(6116002)(8676002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2942; H:[192.168.1.2];
	FPR:; SPF:None; MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; MWHPR0101MB2942;
	23:Xq38fQtJavr7h0QurLFBwRAXuGe/GkBot+1?=
	=?Windows-1252?Q?AsY5t+sWDiBpC68MQFPGJNeEezDGMZIE0tyGsKy5lg7GPIuHFQe5zPCs?=
	=?Windows-1252?Q?i4Nq+ZyUCnlZtkIMkNQn1fgkAhvlUo7GYNaYv6AIlrszoqJV9PMsydbu?=
	=?Windows-1252?Q?5bM+er7KqbYFkvhaNCEQlXrCQ/v7prweWh8hcGOO8udS9LRWGkJrFvy1?=
	=?Windows-1252?Q?uqFhyKCPhmrTnPNzp5r5uxlP8M6UBQXbX5UAIyhMAwNVWi6zzoR6FLiD?=
	=?Windows-1252?Q?myuUA+sOauIiwT4wQ5fy8wzE+cw8z5hK0VWWg3u0wtPEJxOprmoEjRFB?=
	=?Windows-1252?Q?DGFAUEFP9kdFuqOeKh0rtE7vSDlwb79V9MMUGfQiZXsSXzbDPDC74Myd?=
	=?Windows-1252?Q?k21AftFRFi0i1Xv2ZI7p9WxMAgLTgSbaAk+AVtHTn0whEuE0M0fww0ji?=
	=?Windows-1252?Q?PsWEVNhQxfoi6bIXcupQuO8yVPLOnRV/VrG8WrY1RqUbllSGhXZeJgSM?=
	=?Windows-1252?Q?ZhKUUDDwZWlh8U0bUzae9bLI5ydJPrRL8LQ+lO3JNydoXFsSI2RLatiR?=
	=?Windows-1252?Q?/+AIXWE3Hr+t0SkMRy10+qEg9yrLSVY5dvuujbngqKONyiLFwvwtAMQI?=
	=?Windows-1252?Q?23JgmshfLHbJyMhFrJrApjPP2ofUmj7ilkbDPEMQZjzg+J0nsSlfQmrn?=
	=?Windows-1252?Q?VkBIkS2mqHKZLMBUmkSe5Opa5TiK7ZO0EUBpj5C0DHB5G2SxsFZvjcFf?=
	=?Windows-1252?Q?00c+18wDfCcIqREwk9S4xyYohjVmAeGTtqgR/CarnWY+2KZry53Gt+qi?=
	=?Windows-1252?Q?8zuSVh8Vj8N0XRTMIHKD0oVxKoCAeJW0+Q3MMf2hg9uwyzYzgBKJqlhr?=
	=?Windows-1252?Q?04Z+MfuBPofY5Yx0QhXTIxozrj1RruN3WMC0uuchVI9zZVaJ+NehtV/9?=
	=?Windows-1252?Q?E8r4RCstMS4mba4gkjbX3y8XyzW7KTr47Vyy8J/RCG/cRbXzRDKiN4Xp?=
	=?Windows-1252?Q?0QTop4uDXroWjQCu06EwRzHttucfxPsLbxvKprvz5Mzcs5EzkZ4hadcX?=
	=?Windows-1252?Q?xyBfgwy40MD38/C99CAHCwTtfW2gUSe7pmCuKJTxd3z40KbjBErUlq61?=
	=?Windows-1252?Q?oKarP1ieE/Y+LUd5yNn/IHbiQXMOD+fhqgx7Dp/om0MMy7LPA2XfANGD?=
	=?Windows-1252?Q?nnUT5asguG7U8js4yQUG0QCCF84t+SgMcpA+qigVMKx+jIAX2ghVf3rL?=
	=?Windows-1252?Q?oNjytnY416HUr8yauleQOT5EN7TsqwM8QqEYSZEDyoKLOAG4I+AmO8/l?=
	=?Windows-1252?Q?aaxWNiZ5cNh4mDBermlCfqfFR/ENl8LYhVwknxjb2/YPLsBGQZEwurOq?=
	=?Windows-1252?Q?9oA/jaUm7MosSkq2QpFByXeM0zP76dpMFoG45i+QNzThHtyOTfqt6M9X?=
	=?Windows-1252?Q?9g5tOnT1wvfvCASkQlt4ZDKctcMgk9MCxgYZVS2/Y2qOynIGFjNDiOmq?=
	=?Windows-1252?Q?0zfAPo9hasev2XmTiQFHiWztlNiTfYnnwW8lFWG5iI76kUJovUSBMiPu?=
	=?Windows-1252?Q?kYXzetBfsuNTl0zCvJT/h0bejH7umvdUjpve+SkVgu6l75Oc53O+VuQv?=
	=?Windows-1252?Q?mRg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; MWHPR0101MB2942;
	6:OHddSF2kJ0Dy1z0fECOdZSw3bwsQrr0So0Hs?=
	=?Windows-1252?Q?yk8gSacLiZqbjAMKtkI94GcJaXcYmWTXqfvvUmmtGE5FZ+PlajBuz2eA?=
	=?Windows-1252?Q?Zf0VGRSgf5Qix9tw9Qfennoyax88Y3+SFlW/r5is+gmR5OONYpMw4J45?=
	=?Windows-1252?Q?bYXQeA57/61HS6F/8KJ7SYaIU4OMXmoiS8QRq+O0lo2BffCSthri08a3?=
	=?Windows-1252?Q?uOYQr0k/NcC0uXtq7/XR2pePSocdgiwkNpRopaKjrWKC5UvwQnLrXPrN?=
	=?Windows-1252?Q?q+TV9J5rkwFY62BA+tB/hy3wDSDrttqUAMT9xbcLRi6HFJ7UXQ2o5+pv?=
	=?Windows-1252?Q?0GHdxSBDZg1ImTR8a9en6uXHVemRC0B3BSxnUdRs98IXWmWWkUQuwTYI?=
	=?Windows-1252?Q?PIdehOcv7vntrOX7UzBWmoYgU5HDDRP0mHyARYiVZDzxQc+6NXTf50aH?=
	=?Windows-1252?Q?o7jTNbjZA2d6+gyzzugGoJh8outZR7fda3lNh+Cws+W+w32sKjGcaqTJ?=
	=?Windows-1252?Q?ZNaIbgkL7J661Th9SYzVmamrQrhIIMSK2hE34qGcOUoiNWCXd9Q+nx9J?=
	=?Windows-1252?Q?BkdBCFLbYuMYGDxl5s951lJ3UcJY54ZEbC8DufLPJAneVAW97rrBEJ8u?=
	=?Windows-1252?Q?Nqp7DZgywEuNud+FsK6xKbCF2HdC2T7IW8CGSiVWlhB5CW1OGUeQ+jUr?=
	=?Windows-1252?Q?swsMa/5NKXGvB/8Ylh6yT5i5RKbdgOemTfWVwk8OOysXcTlQ+DcRqwVD?=
	=?Windows-1252?Q?p+fCtb8tMeJIlf4ONm2IyJSZB7Yg8yng6AMs5krWG6BJuWIjf9S+C1QO?=
	=?Windows-1252?Q?lNSaE8vvjTffBiFSX+1KNYTVEfb8cBgxrQbzOXlpFZt0XxPFBWzZjUSI?=
	=?Windows-1252?Q?/virgp6ytMZ4I7aQCtDPS2zG2scPvngNWEax4Ue4QnqUdFEg5oG+3dmT?=
	=?Windows-1252?Q?6HorEn2DdhCDmFJzYnpZuYT/ol8UQH0m+PpJuM0veu9I6qQgy6vTXN3J?=
	=?Windows-1252?Q?ChrklL9QP/0cZyBbfA0YMEC4TfmEU3bEy1lsZ85NczINMPVO5XE1vZqY?=
	=?Windows-1252?Q?YV0NsqDsh8VC1y0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	5:KvVNZh6maoK6pMZiDCK2i6hVwrMjApefJnjrhECqJHSZ7Ek1rTSvGhmZcuLK42aEw7MI2btLBgXKtvGQVyzspmZwtbCxIoFmj8tT0/DzisW84bO46p1WhlyshVC32Q+TLn4pYbrKraaDy7hqx8/ixabR25KOfjeEihrhLLHAbEjHve4MPrAJ58HdwUBvuX5VKtOnKqUbE78SvjCTUGi6WzsTUMDHAP2hHHIQnjpchj0gxA6rkJkS3/e+ZHIy2wZAJZ1fEVJtTTYZHxywHhFbVtqmWqXt7TclXVCsN2/LvuoE+vHKS01yBHDedGvUHS74xFXWO9yp0G2GMvFi24BDdDPxa4TM1sTutxCx6dnkjILQqcCZPxAfuTutazSVugB8cm3oyszlMSm3xdytUVJ5P/FBnEhg8cBEUO+h3mNC1AAs1bmVCtyLV572WnboCLTxCWRAC/46iAcUetRXmNTK+II/XgPIn3P0a45UhFqR14U99zQBWUswGOOjHsuLZZrk;
	24:loJy++I4ZeUvYplOnkoZJ9rsj7vmPUlLfUY4o7Lk4RbJFAI0yHJimOHQF62opHz8gjQhoPv7i9rTE13BuTpRmXiXLO39SfXPbBaIhxWdzBs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	7:6G5k/sqR6O7jNuEABO8f2lVqtxreD90zsJgJ7ZKhc5+dZ7guZUpMgKHQchAmotGVe5EH3fL1AaEmbXWC0UF7JZwdyovj9rYm7NSwjrqe7Nma3tMEX2S9elC9nClbjTifqfm0wdeHlsPbhvjGSqZoKWdZXV2bPe73jJC1WK3DVaebwqG7vin211t08uQnLCw2rBiTVh5pp9JkSAH3fh5QncM6wqYVKpO/oiJmS9/+2cFGVsZ0idFW/EDxhc1M6KyRlcgw0XNOCV/d8bdllilTOtyhue5V45FZLT5ltLhaPuKERrBSRwwkbuGa29Ai/ZK44VdGI8n0rIN7FaDtHub0CxjY4tx16sEDbdcJj8t5sEzGCu37sJnHOX4MzLkJVmIS/Z8prvH/G4uRQqfoDseYKhdAe+0jwArxr93Dvdq12LOYycO3YoO3JtOSuHXGwfXGPVUQQ3azwbjnGtpMbF+ZcZjvLk2tyujNmtxm7Ept+t6+gZuGCAl6xwIStqkGc5LuF4EkpqYfSORuP4zuwgewzPnbpGdZIAiYkZ3+FWQEd8g+vWxqanguHVr7KHXUnJLELC3/Wj+LtmNVvZOS48cfHo6rMXBJoNnrqjqI5tiyoc3hVMbiQEL7jpMoYSErCG1saZDUy8ar43ARNvMjOMmcqYXe4y8m/zpj6x9zAeDVDjPpOylBMSKOJIbmfW/lHo/2j3i5/5rj7DACUHbnNK+Scc5BgW4CvOJ7iOByoDxtkBE1tZwFPl68vpwBeVyeDJszBzBfsGqNFbGwwFtEKUns7ujLX4yE7O4i7PIidgl6EDU=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2017 19:07:09.6206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2942
Subject: Re: [morty][PATCH 1/1] openssl-native: Compile with -fPIC
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
X-List-Received-Date: Tue, 11 Jul 2017 19:07:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Is there any issue with backporting this to morty? It would help me fix 
a build crash I'm seeing on morty, and I'm currently using the backport 
in a separate repo with no issue.

On 06/28/2017 11:06 AM, Martin Kelly wrote:
> On 05/26/2017 12:03 AM, Mirza Krak wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> Fixes
>> | /usr/bin/ld: libcrypto.a(sha1-x86_64.o): relocation R_X86_64_PC32
>> against undefined symbol `OPENSSL_ia32cap_P' can not be used when
>> making a shared object; recompile with -fPIC
>> | /usr/bin/ld: final link failed: Bad value
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit 0a19e72081771fca8ed94fb2a2a8996fd3dce00c)
>> Signed-off-by: Mirza Krak <mirza.krak@endian.se>
>> ---
>>
>> I hit the same compiler error as in above commit message when running
>> on morty branch.
>>
>> I simply cherry-picked that fix in to morty branch. I looked in the
>> git log of oe-core and it seems to me that it shall be ok to do that?
>>
>> This is a re-send since I messed up Subject the first time around [1]
>>
>
> I want to put in my $0.02 that I have hit the same issue and would also
> like the fix to be cherry-picked into morty. I tested and agree that it
> seems to work with no issue.
>
>> [1].
>> http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136489.html
>>
>>
>>  meta/recipes-connectivity/openssl/openssl_1.0.2j.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>> index 9a7cdedd05..b6fb126349 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>> @@ -5,6 +5,7 @@ require openssl.inc
>>  DEPENDS += "cryptodev-linux"
>>
>>  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>> +CFLAG_append_class-native = " -fPIC"
>>
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
>>
>> --
>> 2.13.0
>>

